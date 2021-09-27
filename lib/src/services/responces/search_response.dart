import 'package:gists_explorer/src/models/filter_item.dart';
import 'package:gists_explorer/src/models/gist_declaration.dart';

class SearchResponse {
  final List<GistDeclaration> gistsOnCurrentPage;
  final List<FilterItem> filterItems;
  final int totalPages;
  final int totalGists;
  final int currentPageIndex;

  SearchResponse({
    required this.gistsOnCurrentPage,
    required this.totalPages,
    required this.totalGists,
    required this.currentPageIndex,
    required this.filterItems,
  });
}
