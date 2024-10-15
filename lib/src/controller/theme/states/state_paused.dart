import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/theme/states/state.dart';

class BubbleStatePaused extends BubbleState {
  const BubbleStatePaused()
      : super(
          primaryColor: Colors.green,
          secondaryColor: Colors.black,
        );
}
