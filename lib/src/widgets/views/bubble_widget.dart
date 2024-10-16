import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/controllers.dart';
import 'package:weave_bubble/src/widgets/painters/bubble_painter.dart';

class BubbleWidget extends StatefulWidget {
  const BubbleWidget({
    super.key,
    required this.bubbleController,
  });

  final BubbleController bubbleController;

  @override
  State<BubbleWidget> createState() => _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget> {
  Timer? _timer;

  BubbleController get bubbleController => widget.bubbleController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer?.cancel();
      _timer = Timer.periodic(const Duration(milliseconds: 50), (_) {
        setState(() {});
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: bubbleController.interaction.state.isActive
          ? () {
              bubbleController.interaction.preAction();
              bubbleController.interaction.onTapToDeactivate();
              bubbleController.themeState = const BubbleStateStopped();
              bubbleController.interactionStateIsActive = false;
            }
          : () {
              bubbleController.interaction.preAction();
              bubbleController.interaction.onTapToActivate();
              bubbleController.themeState = const BubbleStateSpinning();
              bubbleController.interactionStateIsActive = true;
            },
      onLongPress: () {
        bubbleController.interaction.preAction();
        bubbleController.interaction.onHold();
        bubbleController.themeState = const BubbleStateSpinning();
        bubbleController.interactionStateIsActive = true;
      },
      onLongPressEnd: (LongPressEndDetails details) {
        bubbleController.interaction.preAction();
        bubbleController.interaction.onRelease();
        bubbleController.themeState = const BubbleStateStopped();
        bubbleController.interactionStateIsActive = false;
      },
      child: Container(
        width: bubbleController.settings.bubbleSize.width,
        height: bubbleController.settings.bubbleSize.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(
              color: bubbleController.theme.state.primaryColor, width: 5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: CustomPaint(
            painter: BubblePainter(streams: bubbleController.streams),
          ),
        ),
      ),
    );
  }
}
