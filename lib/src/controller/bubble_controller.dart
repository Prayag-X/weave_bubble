import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:weave_bubble/src/controller/actions/actions.dart';
import 'package:weave_bubble/src/controller/interactions/interaction.dart';
import 'package:weave_bubble/src/controller/settings/settings.dart';
import 'package:weave_bubble/src/controller/streams/streams.dart';
import 'package:weave_bubble/src/controller/theme/themes.dart';
import 'package:weave_bubble/src/widgets/bubble_inherited.dart';

part 'bubble_controller_value.dart';

class BubbleController extends ValueNotifier<BubbleControllerValue> {
  final GlobalKey bubbleKey;

  BubbleController({
    List<BubbleStream>? streams,
    BubbleTheme? theme,
    BubbleSettings? settings,
    BubbleInteraction? interaction,
  }) : this.fromState(BubbleControllerValue(
          streams: streams ?? const [],
          theme: theme ?? const BubbleTheme(),
          settings: settings ?? const BubbleSettings(),
          interaction: interaction ?? const BubbleInteraction(),
        ));

  BubbleController copyWith({
    List<BubbleStream>? streams,
    BubbleTheme? theme,
    BubbleSettings? settings,
    BubbleInteraction? interaction,
  }) =>
      BubbleController(
        streams: streams ?? value.streams,
        theme: theme ?? value.theme,
        settings: settings ?? value.settings,
        interaction: interaction ?? value.interaction,
      );

  BubbleController.fromState(super.value) : bubbleKey = GlobalKey();

  static BubbleController of(BuildContext context) =>
      BubbleInherited.of(context).controller;

  void addStream(BubbleStream stream) => AddStreamAction(stream)..call(this);

  bool removeStream(BubbleStream stream) {
    BubbleAction action = RemoveStreamAction(stream);
    return action.call(this);
  }

  void pushToStream(String streamId, dynamic data) =>
      PushToStreamAction(streamId, data)..call(this);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BubbleController) return false;
    return value == other.value && bubbleKey == other.bubbleKey;
  }

  @override
  int get hashCode => Object.hash(value, bubbleKey);
}
