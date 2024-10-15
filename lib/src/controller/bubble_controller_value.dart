part of 'bubble_controller.dart';

class BubbleControllerValue {
  final List<BubbleStream> _streams;
  final BubbleTheme _theme;
  final BubbleSettings _settings;
  final BubbleInteraction _interaction;

  List<BubbleStream> get streams => List.unmodifiable(_streams);
  BubbleTheme get theme => _theme;
  BubbleSettings get settings => _settings;
  BubbleInteraction get interaction => _interaction;

  const BubbleControllerValue({
    BubbleTheme theme = const BubbleTheme(),
    List<BubbleStream> streams = const [],
    BubbleSettings settings = const BubbleSettings(),
    BubbleInteraction interaction = const BubbleInteraction(),
  })  : _streams = streams,
        _theme = theme,
        _settings = settings,
        _interaction = interaction;

  BubbleControllerValue copyWith({
    List<BubbleStream>? streams,
    BubbleTheme? theme,
    BubbleSettings? settings,
    BubbleInteraction? interaction,
  }) =>
      BubbleControllerValue(
        theme: theme ?? _theme,
        streams: streams ?? _streams,
        settings: settings ?? _settings,
        interaction: interaction ?? _interaction,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BubbleControllerValue) return false;
    return listEquals(streams, other.streams) &&
        _theme == other._theme &&
        _settings == other._settings &&
        _interaction == other._interaction;
  }

  @override
  int get hashCode => Object.hash(
        Object.hashAll(streams),
        _theme,
        _settings,
        _interaction,
      );
}
