import 'package:flutter/material.dart';

class BubbleSettings {
  final Size bubbleSize;
  final double movableArea;

  const BubbleSettings({
    this.bubbleSize = const Size(70, 70),
    this.movableArea = 100,
  });
}
