import 'dart:math';

import 'package:flutter/material.dart';
import 'clock_hand.dart';
import 'clock_markers.dart';
import 'elapsed_time_text.dart';

class StopwatchRenderer extends StatelessWidget {
  const StopwatchRenderer(
      {Key? key, required this.elapsed, required this.radius})
      : super(key: key);

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
              left: radius,
              top: radius,
              child: ClockSecondsTickMarker(seconds: i, radius: radius)),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
              left: radius,
              top: radius,
              child: ClockTextMaker(value: i, maxValue: 60, radius: radius)),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
              rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
              handThickness: 2,
              handLength: radius,
              color: Colors.orange),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius * 1.3,
          child: ElapsedTimeText(
            elapsed: elapsed,
          ),
        ),
      ],
    );
  }
}
