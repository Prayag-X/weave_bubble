import 'package:flutter/foundation.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';

abstract class BubbleAction<T> {
  T call(BubbleController controller) {
    return call$(controller);
  }

  @protected
  T call$(BubbleController controller);
}
