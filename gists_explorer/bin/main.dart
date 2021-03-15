import 'dart:convert';
import 'dart:io';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';

void main(List<String> arguments) async {
  await initiate();
}

String clearText(String source) =>
    source != null ? source.trim().replaceAll('\\n', '') : source;

Future initiate() async {
  final body = File(
          '/Users/andreysmirnov/projects/gists_explorer/gists_explorer/assets/search_results.html')
      .readAsStringSync();

  final document = parse(body);
  final gistsCountElement =
      document.querySelector('div.col-8 > div.pb-3 > h3 > div.d-flex >h3');

  if (gistsCountElement != null) {
    var text = gistsCountElement.text.trim();
    final numeric = text.replaceAll(RegExp('[^0-9]'), '');
    print(numeric);

    final count = int.tryParse(numeric) ?? 0;
    print(count);
  }

  final currentPagesCountElement =
      document.querySelector('div[role=\'navigation\'] > em[data-total-pages]');
  if (currentPagesCountElement != null) {
    final pages =
        int.tryParse(currentPagesCountElement.attributes['data-total-pages']);
    print(pages);
  }

  final snippetElements = document.querySelectorAll('div.gist-snippet');
  for (final snippetElement in snippetElements) {
    ///
    /// meta
    ///
    final metaElement = snippetElement.querySelector('div.gist-snippet-meta');
    final authorElement = metaElement.querySelector(
        'div > div.px-lg-2 > span > a[data-hovercard-type=\'user\']');
    final author = authorElement.text.trim();
    final avatarUrl = metaElement.querySelector('img.avatar-user').attributes['src'];
    final fileNameElement =
        metaElement.querySelector('strong.css-truncate-target');
    final fileName = fileNameElement.text.trim();
    final gistId = fileNameElement.parent.attributes['href'];
    final timeAgo = metaElement.querySelector('time-ago').text.trim();
    final tagElements =
        metaElement.querySelectorAll('ul > li.d-inline-block > a.Link--muted');
    final filesCount = tagElements.first.text.trim();
    final forksCount = tagElements[1].text.trim();
    final commentsCount = tagElements[2].text.trim();
    final starsCount = tagElements.last.text.trim();

    final gistNameElement =
        metaElement.querySelector('div > div.px-lg-2 > span.f6');
    final gistName = gistNameElement != null ? gistNameElement.text.trim() : '';

    print('_' * 60);
    print('author -> $author');
    print('avatarUrl -> $avatarUrl');
    print('fileName -> $fileName');
    print('gistId -> $gistId');
    print('timeAgo -> $timeAgo');
    print('gistName -> $gistName');
    print('filesCount -> $filesCount');
    print('forksCount -> $forksCount');
    print('commentsCount -> $commentsCount');
    print('starsCount -> $starsCount');

    ///
    /// file-box
    ///
    final fileBoxElement = snippetElement.querySelector('div.file-box');
    final codeTableRowElements = fileBoxElement
        .querySelectorAll('table.js-file-line-container > tbody > tr');
    for (final trElement in codeTableRowElements) {
      final lineNumber = trElement.getElementsByTagName('td').first.attributes['data-line-number'];
      final codeLine = trElement.getElementsByTagName('td').last.text.trim();
      print('$lineNumber  $codeLine');
    }
  }
}
