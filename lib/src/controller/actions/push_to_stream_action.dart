import 'package:weave_bubble/src/controller/actions/action.dart';
import 'package:weave_bubble/src/controller/bubble_controller.dart';
import 'package:weave_bubble/src/controller/extensions/extensions.dart';
import 'package:weave_bubble/src/controller/streams/streams.dart';

class PushToStreamAction extends BubbleAction<void> {
  final String streamId;
  final dynamic data;

  PushToStreamAction(this.streamId, this.data);

  @override
  void call$(BubbleController controller) {
    List<BubbleStream> newStreams = controller.streams.map((stream) {
      if (stream.id == streamId) {
        stream.addWaveform(data);
      }
      return stream;
    }).toList();
    controller.value = controller.value.copyWith(
      streams: newStreams,
    );
  }
}

