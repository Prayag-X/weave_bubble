import 'package:weave_bubble/src/controller/actions/action.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';
import 'package:weave_bubble/src/controller/extensions/extensions.dart';
import 'package:weave_bubble/src/controller/streams/streams.dart';

class AddStreamAction extends BubbleAction<void> {
  final BubbleStream stream;

  AddStreamAction(this.stream);

  @override
  void call$(BubbleController controller) {
    List<BubbleStream> newStreams = List.from(controller.streams);
    newStreams.add(stream);
    controller.value =
        controller.value.copyWith(streams: newStreams);
    stream.init();
  }
}
