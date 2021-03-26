import 'package:flutter_test/flutter_test.dart';
import 'package:gists_explorer/src/services/gists_api.dart';
import 'package:gists_explorer/src/services/requests/search_request.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final api = GistsApi();

  group('API should', () {
    test('', () async {
      final result = await api.search(
        SearchRequest(language: 'dart'),
      );

      expect(result.filterItems, isNotEmpty);
    });
  });
}
