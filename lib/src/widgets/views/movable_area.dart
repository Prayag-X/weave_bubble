import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/controllers.dart';

class MovableArea extends StatefulWidget {
  const MovableArea({super.key, required this.child});
  final Widget child;


  @override
  State<MovableArea> createState() => _MovableAreaState();
}

class _MovableAreaState extends State<MovableArea> {
  BubbleController get controller => BubbleController.of(context);

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
  