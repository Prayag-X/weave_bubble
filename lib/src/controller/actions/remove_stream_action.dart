import 'package:weave_bubble/src/controller/actions/action.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';
import 'package:weave_bubble/src/controller/extensions/extensions.dart';
import 'package:weave_bubble/src/controller/streams/streams.dart';

class RemoveStreamAction extends BubbleAction<bool> {
  final BubbleStream stream;

  RemoveStreamAction(this.stream);

  @override
  bool call$(BubbleController controller) {
    if (controller.streams.contains(stream)) {
      stream.dispose();
      List<BubbleStream> newStreams = List.from(controller.streams);
      newStreams.remove(stream);
      controller.value = controller.value.copyWith(streams: newStreams);
      return true;
    }
    return false;
  }
}


