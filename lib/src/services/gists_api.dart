import 'package:dio/dio.dart';
import 'package:gists_explorer/src/models/code_line.dart';
import 'package:gists_explorer/src/models/gist_declaration.dart';
import 'package:gists_explorer/src/services/requests/search_request.dart';
import 'package:gists_explorer/src/services/responces/search_response.dart';
import 'package:html/parser.dart' as parser;

class GistsApi {
  Future<SearchResponse> search(SearchRequest request) async {
    const uri = 'https://gist.github.com/search';
    print('quering the uri $uri');
    final response = await Dio().get(
      uri,
      queryParameters: {
        'q': 'language:${request.language}',
        'p': request.currentPage,
      },
    );

    return _parseResponse(response.data.toString());
  }

  SearchResponse _parseResponse(String body) {
    final document = parser.parse(body);
    final gistsCountElement =
        document.querySelector('div.col-8 > div.pb-3 > h3 > div.d-flex >h3');

    var totalCount = 0;
    if (gistsCountElement != null) {
      var text = gistsCountElement.text.trim();
      final numeric = text.replaceAll(RegExp('[^0-9]'), '');
      totalCount = int.tryParse(numeric) ?? 0;
    }

    final currentPagesCountElement = document
        .querySelector('div[role=\'navigation\'] > em[data-total-pages]');
    var totalPages = 0;
    var currentPage = 0;
    if (currentPagesCountElement != null) {
      totalPages =
          int.tryParse(currentPagesCountElement.attributes['data-total-pages']);
      currentPage = int.tryParse(currentPagesCountElement.text.trim());
    }

    final List<GistDeclaration> gists = [];
    final snippetElements = document.querySelectorAll('div.gist-snippet');
    for (final snippetElement in snippetElements) {
      ///
      /// meta
      ///
      final metaElement = snippetElement.querySelector('div.gist-snippet-meta');
      final authorElement = metaElement.querySelector(
          'div > div.px-lg-2 > span > a[data-hovercard-type=\'user\']');
      final author = authorElement.text.trim();
      final avatarUrl =
          metaElement.querySelector('img.avatar-user').attributes['src'];
      final fileNameElement =
          metaElement.querySelector('strong.css-truncate-target');
      final fileName = fileNameElement.text.trim();
      final gistId = fileNameElement.parent.attributes['href'].split('/').last;
      final timeAgo = metaElement.querySelector('time-ago').text.trim();
      final tagElements = metaElement
          .querySelectorAll('ul > li.d-inline-block > a.Link--muted');
      final filesCount = tagElements.first.text.trim();
      final forksCount = tagElements[1].text.trim();
      final commentsCount = tagElements[2].text.trim();
      final starsCount = tagElements.last.text.trim();

      final gistNameElement =
          metaElement.querySelector('div > div.px-lg-2 > span.f6');
      final gistName =
          gistNameElement != null ? gistNameElement.text.trim() : '';

      ///
      /// file-box
      ///
      final List<CodeLine> codeLines = [];
      final fileBoxElement = snippetElement.querySelector('div.file-box');
      final codeTableRowElements = fileBoxElement
          .querySelectorAll('table.js-file-line-container > tbody > tr');
      for (final trElement in codeTableRowElements) {
        final lineNumber = int.tryParse(
          trElement
              .getElementsByTagName('td')
              .first
              .attributes['data-line-number'],
        );
        final codeLine = trElement.getElementsByTagName('td').last.text.trim();
        codeLines.add(CodeLine(lineNumber: lineNumber, loc: codeLine));
      }

      gists.add(
        GistDeclaration(
          author: author,
          avatarUrl: avatarUrl,
          fileName: fileName,
          gistId: gistId,
          timeAgo: timeAgo,
          gistName: gistName,
          filesCount: filesCount,
          forksCount: forksCount,
          commentsCount: commentsCount,
          starsCount: starsCount,
          preview: codeLines,
        ),
      );
    }

    return SearchResponse(
      currentPageIndex: currentPage,
      totalPages: totalPages,
      totalGists: totalCount,
      gistsOnCurrentPage: gists,
    );
  }
}
