import 'states/states.dart';
import 'emotions/emotions.dart';

class BubbleTheme {
  final BubbleState state;
  final Emotion emotion;

  const BubbleTheme({
    this.state = const BubbleStateStopped(),
    this.emotion = const CalmEmotion(),
  });

  BubbleTheme copyWith({
    BubbleState? state,
    Emotion? emotion,
  }) =>
      BubbleTheme(
        state: state ?? this.state,
        emotion: emotion ?? this.emotion,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BubbleTheme &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          emotion == other.emotion;

  @override
  int get hashCode => state.hashCode ^ emotion.hashCode;
}
