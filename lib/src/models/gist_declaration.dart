import 'code_line.dart';

class GistDeclaration {
  final String author;
  final String? avatarUrl;
  final String fileName;
  final String gistId;
  final String timeAgo;
  final String gistName;
  final String filesCount;
  final String forksCount;
  final String commentsCount;
  final String starsCount;
  final Iterable<CodeLine> preview;

  GistDeclaration({
    required this.author,
    required this.avatarUrl,
    required this.fileName,
    required this.gistId,
    required this.timeAgo,
    required this.gistName,
    required this.filesCount,
    required this.forksCount,
    required this.commentsCount,
    required this.starsCount,
    required this.preview,
  });

  @override
  String toString() =>
      'GistDeclaration{author: $author, avatarUrl: $avatarUrl, fileName: $fileName, gistId: $gistId, timeAgo: $timeAgo, gistName: $gistName, filesCount: $filesCount, forksCount: $forksCount, commentsCount: $commentsCount, starsCount: $starsCount, preview: $preview}';
}
