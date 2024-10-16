import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/controllers.dart';
import 'package:weave_bubble/src/widgets/painters/bubble_painter.dart';
import 'package:weave_bubble/src/widgets/views/bubble_widget.dart';
import 'package:weave_bubble/src/widgets/views/movable_area.dart';

class Bubble extends StatelessWidget {
  const Bubble({super.key});

  @override
  Widget build(BuildContext context) {
    BubbleController bubbleController = BubbleController.of(context);
    return ValueListenableBuilder<BubbleControllerValue>(
      valueListenable: bubbleController,
      builder: (context, _, __) => MovableArea(
        child: BubbleWidget(
          bubbleController: bubbleController,
        ),
      ),
    );
  }
}
