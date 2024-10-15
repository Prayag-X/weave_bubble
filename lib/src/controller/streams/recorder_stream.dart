import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:weave_bubble/src/controller/streams/stream.dart';

class RecorderStream extends BubbleStream {
  RecorderStream({
    super.id = '',
    super.updateInterval,
    super.widthPerSegment,
    super.color,
    super.waveforms,
    super.waveAmplitudes,
  });

  @override
  RecorderStream copyWith({
    String? id,
    Duration? updateInterval,
    double? widthPerSegment,
    Color? color,
    List<double>? waveforms,
    List<double>? waveAmplitudes,
  }) =>
      RecorderStream(
        id: id ?? this.id,
        updateInterval: updateInterval ?? this.updateInterval,
        widthPerSegment: widthPerSegment ?? this.widthPerSegment,
        color: color ?? this.color,
        waveforms: waveforms ?? this.waveforms,
        waveAmplitudes: waveAmplitudes ?? this.waveAmplitudes,
      );

  Int16List convertTo16Bit(Uint8List uint8List) {
    int length = uint8List.length ~/ 2;
    Int16List int16List = Int16List(length);

    for (int i = 0; i < length; i++) {
      int16List[i] = (uint8List[i * 2] | (uint8List[i * 2 + 1] << 8));
    }
    return int16List;
  }

  @override
  double convertToWaveform(dynamic data) {
    Int16List samples = convertTo16Bit(data);
    double sumOfSquares = 0.0;

    for (int sample in samples) {
      sumOfSquares += sample * sample;
    }

    double meanOfSquares = sumOfSquares / samples.length;
    double rms = sqrt(meanOfSquares);

    double amplitude = rms / 32767.0;
    return amplitude * 6;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BubbleStream) return false;
    return updateInterval == other.updateInterval &&
        widthPerSegment == other.widthPerSegment &&
        color == other.color &&
        waveAmplitudes == other.waveAmplitudes &&
        waveforms == other.waveforms;
  }

  @override
  int get hashCode => Object.hash(
        updateInterval,
        widthPerSegment,
        color,
        Object.hashAll(waveAmplitudes),
        Object.hashAll(waveforms),
      );
}
