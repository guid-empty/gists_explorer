class Elevation {
  static const Elevation $0dp = Elevation._(0);
  static const Elevation $1dp = Elevation._(1);
  static const Elevation $2dp = Elevation._(2);
  static const Elevation $3dp = Elevation._(3);
  static const Elevation $4dp = Elevation._(4);
  static const Elevation $5dp = Elevation._(5);
  static const Elevation $6dp = Elevation._(6);
  static const Elevation $8dp = Elevation._(8);
  static const Elevation $12dp = Elevation._(12);
  static const Elevation $16dp = Elevation._(16);
  static const Elevation $24dp = Elevation._(24);

  final double value;

  const Elevation._(this.value);

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Elevation &&
          runtimeType == other.runtimeType &&
          value == other.value;

  @override
  String toString() => '$value';
}
