class CodeLine {
  final int lineNumber;
  final String loc;

  CodeLine({
    required this.lineNumber,
    required this.loc,
  });

  @override
  String toString() => 'CodeLine{lineNumber: $lineNumber, loc: $loc}';
}
