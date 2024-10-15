import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';
import 'package:weave_bubble/src/widgets/bubble_inherited.dart';

class BubbleScope extends StatelessWidget {
  const BubbleScope({
    super.key,
    required this.child,
    required this.controller,
  });

  final Widget child;
  final BubbleController controller;

  @override
  Widget build(BuildContext context) {
    return BubbleInherited(
      controller: controller,
      child: ValueListenableBuilder<BubbleControllerValue>(
        valueListenable: controller,
        builder: (context, _, __) => child,
      ),
    );
  }
}
