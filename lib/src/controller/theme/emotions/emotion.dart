import 'dart:ui';

abstract class Emotion {
  final Color primaryColor;
  final Color secondaryColor;

  const Emotion({
    required this.primaryColor,
    required this.secondaryColor,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Emotion &&
          runtimeType == other.runtimeType &&
          primaryColor == other.primaryColor &&
          secondaryColor == other.secondaryColor;

  @override
  int get hashCode => primaryColor.hashCode ^ secondaryColor.hashCode;
}
