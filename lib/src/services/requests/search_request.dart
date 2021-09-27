class SearchRequest {
  final int currentPage;
  final String? language;
  final String? filename;

  SearchRequest({
    required this.language,
    this.currentPage = 0,
    this.filename,
  });

  String toQuery() {
    final buffer = StringBuffer();
    if (language?.isNotEmpty ?? false) {
      buffer.write('language:$language');
    }

    if (filename?.isNotEmpty ?? false) {
      buffer.write('filename:$filename');
    }

    return buffer.toString();
  }
}
