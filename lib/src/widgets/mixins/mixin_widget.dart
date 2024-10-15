import 'package:flutter/widgets.dart';
import 'package:weave_bubble/src/controller/controllers.dart';

mixin BubbleMixinStateless on StatelessWidget {
  @protected
  Widget buildWithListener(BuildContext context, BubbleController bubbleController);

  @override
  Widget build(BuildContext context) {
    BubbleController bubbleController = BubbleController.of(context);
    return ValueListenableBuilder<BubbleControllerValue>(
      valueListenable: bubbleController,
      builder: (context, _, __) => buildWithListener(context, bubbleController),
    );
  }
}

mixin BubbleMixinStateful<T extends StatefulWidget> on State<T> {
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
