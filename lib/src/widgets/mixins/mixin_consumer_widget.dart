import 'package:flutter/widgets.dart';
import 'package:weave_bubble/src/controller/controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

mixin BubbleMixinConsumer on ConsumerWidget {
  @protected
  Widget buildWithListener(
      BuildContext context, WidgetRef ref, BubbleController bubbleController);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    BubbleController bubbleController = BubbleController.of(context);
    return ValueListenableBuilder<BubbleControllerValue>(
      valueListenable: bubbleController,
      builder: (context, _, __) =>
          buildWithListener(context, ref, bubbleController),
    );
  }
}

mixin BubbleMixinConsumerStateful<T extends ConsumerStatefulWidget>
    on ConsumerState<T> {
  BubbleController get bubbleController => BubbleController.of(context);

  @protected
  Widget buildWithListener(BuildContext context);

  @override
  Widget build(BuildContext context) {
    BubbleController bubbleController = BubbleController.of(context);
    return ValueListenableBuilder<BubbleControllerValue>(
      valueListenable: bubbleController,
      builder: (context, _, __) => buildWithListener(context),
    );
  }
}
