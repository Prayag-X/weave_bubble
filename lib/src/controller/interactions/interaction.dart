import 'interaction_state.dart';

typedef BubbleInteractionAction = void Function();

const BubbleInteractionAction _emptyAction = _doNothing;
void _doNothing() {}

class BubbleInteraction {
  final BubbleInteractionState state;
  final BubbleInteractionAction preAction;
  final BubbleInteractionAction onTapToActivate;
  final BubbleInteractionAction onTapToDeactivate;
  final BubbleInteractionAction onHold;
  final BubbleInteractionAction onRelease;

  const BubbleInteraction({
    this.state = const BubbleInteractionState(),
    this.preAction = _emptyAction,
    this.onTapToActivate = _emptyAction,
    this.onTapToDeactivate = _emptyAction,
    this.onHold = _emptyAction,
    BubbleInteractionAction? onRelease,
  }) : onRelease = onRelease ?? onTapToDeactivate;

  BubbleInteraction copyWith({
    BubbleInteractionState? state,
    BubbleInteractionAction? preAction,
    BubbleInteractionAction? onTapToActivate,
    BubbleInteractionAction? onTapToDeactivate,
    BubbleInteractionAction? onHold,
    BubbleInteractionAction? onRelease,
  }) {
    return BubbleInteraction(
      state: state ?? this.state,
      preAction: preAction ?? this.preAction,
      onTapToActivate: onTapToActivate ?? this.onTapToActivate,
      onTapToDeactivate: onTapToDeactivate ?? this.onTapToDeactivate,
      onHold: onHold ?? this.onHold,
      onRelease: onRelease ?? this.onRelease,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubbleInteraction &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          preAction == other.preAction &&
          onTapToActivate == other.onTapToActivate &&
          onTapToDeactivate == other.onTapToDeactivate &&
          onHold == other.onHold &&
          onRelease == other.onRelease;

  @override
  int get hashCode => Object.hash(
        state,
        preAction,
        onTapToActivate,
        onTapToDeactivate,
        onHold,
        onRelease,
      );
}
