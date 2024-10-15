import 'package:flutter/widgets.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';

class BubbleInherited extends InheritedWidget {
  const BubbleInherited({
    super.key,
    required super.child,
    required this.controller,
  });

  final BubbleController controller;

  static BubbleInherited of(BuildContext context) {
    final BubbleInherited? result =
        context.dependOnInheritedWidgetOfExactType<BubbleInherited>();
    assert(result != null, 'No BubbleController found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BubbleInherited oldWidget) =>
      controller != oldWidget.controller;
}
