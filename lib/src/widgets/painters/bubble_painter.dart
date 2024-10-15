import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/controllers.dart';

class BubblePainter extends CustomPainter {
  final List<BubbleStream> streams;

  BubblePainter({
    required this.streams,
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (BubbleStream stream in streams) {
      stream.drawWaveform(canvas, size);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
