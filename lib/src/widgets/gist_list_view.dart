import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gists_explorer/main.dart';
import 'package:gists_explorer/src/models/gist_declaration.dart';
import 'package:gists_explorer/src/services/requests/search_request.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class GistListView extends StatefulWidget {
  @override
  _GistListViewState createState() => _GistListViewState();
}

class _GistListViewState extends State<GistListView> {
  // 1
  final _pagingController = PagingController<int, GistDeclaration>(
    // 2
    firstPageKey: 1,
  );

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<GistDeclaration>(
          itemBuilder: (context, GistDeclaration gist, index) => Row(
            children: [
              if (gist.avatarUrl?.isNotEmpty ?? false)
                CircleAvatar(
                  foregroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(gist.avatarUrl!),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(gist.fileName),
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => Divider(
          height: 8,
          thickness: 1,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final currentPage = await api.search(
        SearchRequest(
          currentPage: pageKey,
          language: 'dart',
        ),
      );

      print('pageKey is $pageKey');
      final previouslyFetchedItemsCount =
          _pagingController.itemList?.length ?? 0;

      final isLastPage = currentPage.totalPages == currentPage.currentPageIndex;
      final newItems = currentPage.gistsOnCurrentPage;

      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }
}
