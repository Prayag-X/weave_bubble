import 'package:flutter/material.dart';
import 'package:weave_bubble/src/controller/theme/states/state.dart';

class BubbleStateStopped extends BubbleState {
  const BubbleStateStopped()
      : super(
          primaryColor: Colors.green,
          secondaryColor: Colors.black,
        );
}
