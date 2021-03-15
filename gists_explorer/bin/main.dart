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

  final currentPagesCountElement = document.querySelector('div[role=\'navigation\'] > em[data-total-pages]');
  if (currentPagesCountElement != null) {
    final pages = int.tryParse(currentPagesCountElement.attributes['data-total-pages']);
    print(pages);
  }

}
