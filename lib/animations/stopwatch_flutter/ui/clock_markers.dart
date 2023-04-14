import 'dart:math';

import 'package:flutter/material.dart';

class ClockSecondsTickMarker extends StatelessWidget {
  const ClockSecondsTickMarker(
      {Key? key, required this.seconds, required this.radius})
      : super(key: key);

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.grey[700];
    final width = 2.0;
    final height = 12.0;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(-width / 2, -height / 2, 0.0)
        ..rotateZ(2 * pi * (seconds / 60.0))
        ..translate(0.0, radius - height / 2, 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,
      ),
    );
  }
}

class ClockTextMaker extends StatelessWidget {
  const ClockTextMaker(
      {Key? key,
      required this.value,
      required this.maxValue,
      required this.radius})
      : super(key: key);

  final int value;
  final int maxValue;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const width = 40.0;
    const height = 30.0;

    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..translate(-width / 2, -height / 2, 0.0)
          ..rotateZ(pi + 2 * pi * (value / maxValue))
          ..translate(0.0, radius - 35, 0.0)
          ..rotateZ(pi - 2 * pi * (value / maxValue)),
        child: SizedBox(
          width: width,
          height: height,
          child: Text(
            value.toString(),
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
