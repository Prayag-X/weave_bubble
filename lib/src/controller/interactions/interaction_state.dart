class BubbleInteractionState {
  final bool isActive;
  final bool isHolding;

  const BubbleInteractionState({
    this.isActive = false,
    this.isHolding = false,
  });

  BubbleInteractionState copyWith({
    bool? isActive,
    bool? isHolding,
  }) {
    return BubbleInteractionState(
      isActive: isActive ?? this.isActive,
      isHolding: isHolding ?? this.isHolding,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubbleInteractionState &&
          runtimeType == other.runtimeType &&
          isActive == other.isActive &&
          isHolding == other.isHolding;

  @override
  int get hashCode => Object.hash(isActive, isHolding);
}
