import 'package:gists_explorer/src/models/gist_declaration.dart';
import 'package:meta/meta.dart';

class SearchResponse {
  final Iterable<GistDeclaration> gistsOnCurrentPage;
  final int totalPages;
  final int totalGists;
  final int currentPageIndex;

  SearchResponse({
    @required this.gistsOnCurrentPage,
    @required this.totalPages,
    @required this.totalGists,
    @required this.currentPageIndex,
  });
}
