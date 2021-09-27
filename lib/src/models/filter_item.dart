

class FilterItem {
  final String language;
  final String count;

  FilterItem({
    required this.language,
    required this.count,
  });

  @override
  int get hashCode => language.hashCode ^ count.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilterItem &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          count == other.count;

  @override
  String toString() => 'FilterItem{language: $language, count: $count}';
}
