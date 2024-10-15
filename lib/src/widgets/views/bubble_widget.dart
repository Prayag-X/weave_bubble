import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weave_bubble/src/widgets/painters/bubble_painter.dart';
import 'package:weave_bubble/src/widgets/widgets.dart';
import 'package:weave_bubble/src/controller/controllers.dart';

class BubbleWidget extends StatefulWidget {
  const BubbleWidget({
    super.key,
    required this.painter,
  });

  final BubblePainter painter;

  @override
  State<BubbleWidget> createState() => _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget> with BubbleMixinStateful {
  Timer? _timer;

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
  Widget buildWithListener(BuildContext context) {
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
