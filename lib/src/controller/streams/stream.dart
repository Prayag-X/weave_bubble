import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

abstract class BubbleStream {
  BubbleStream({
    this.id = '',
    this.updateInterval = const Duration(milliseconds: 50),
    this.widthPerSegment = 1,
    this.color = const Color.fromARGB(255, 52, 12, 226),
    List<double>? waveforms,
    List<double>? waveAmplitudes,
  })  : _waveforms = waveforms ?? [],
        _waveAmplitudes = waveAmplitudes ?? List.generate(70, (index) => 0.01);

  BubbleStream copyWith({
    String? id,
    Duration? updateInterval,
    double? widthPerSegment,
    Color? color,
    List<double>? waveforms,
    List<double>? waveAmplitudes,
  });

  final String id;
  final Duration updateInterval;
  List<double> _waveforms;
  List<double> _waveAmplitudes;
  final double widthPerSegment;
  final Color color;
  late Timer _timer;

  double convertToWaveform(dynamic data);

  int get maxWaveForms => 70;

  List<double> get waveforms => List.from(_waveforms);

  List<double> get waveAmplitudes => List.from(_waveAmplitudes);

  double get getAverageAmplitude => _waveforms.isEmpty
      ? 0.01
      : _waveforms.reduce((a, b) => a + b) / _waveforms.length;

  void addWaveform(dynamic data) {
    List<double> newWaveforms = List.from(_waveforms); 
    newWaveforms.add(convertToWaveform(data));
    _waveforms = newWaveforms;
  }

  void updateAmplitude() {
    List<double> newAmplitudes = List.from(_waveAmplitudes);
    newAmplitudes.add(getAverageAmplitude);

    if (newAmplitudes.length > maxWaveForms) {
      newAmplitudes.removeAt(0);
    }
    _waveAmplitudes = newAmplitudes;
    _waveforms.clear();
  }

  void init() {
    _timer = Timer.periodic(updateInterval, (_) => updateAmplitude());
  }

  void dispose() {
    _timer.cancel();
  }

  void drawWaveform(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..color = color;
    final double halfHeight = size.height / 2;

    for (int i = 0; i < _waveAmplitudes.length; i++) {
      double x = i * widthPerSegment;
      double normalizedValue = _waveAmplitudes[i].clamp(0, 1);
      double y = normalizedValue * halfHeight;

      final Rect rect =
          Rect.fromLTWH(x, halfHeight - y, widthPerSegment, 2 * y);

      canvas.drawRect(rect, paint);
    }
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! BubbleStream) return false;
    return updateInterval == other.updateInterval &&
        widthPerSegment == other.widthPerSegment &&
        color == other.color &&
        listEquals(waveAmplitudes, other.waveAmplitudes) &&
        listEquals(waveforms, other.waveforms);
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
