import 'dart:ui';

abstract class BubbleState {
  const BubbleState({
    required this.primaryColor,
    required this.secondaryColor,
  });

  final Color primaryColor;
  final Color secondaryColor; 
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BubbleState) return false;
    return primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor;
  }

  @override
  int get hashCode => Object.hash(primaryColor, secondaryColor);
}
