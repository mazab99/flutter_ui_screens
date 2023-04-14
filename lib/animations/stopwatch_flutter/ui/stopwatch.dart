import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_ui_screens/animations/stopwatch_flutter/ui/reset_button.dart';
import 'package:flutter_ui_screens/animations/stopwatch_flutter/ui/start_stop_button.dart';
import 'package:flutter_ui_screens/animations/stopwatch_flutter/ui/stopwatch_renderer.dart';


class StopwatchScreen extends StatefulWidget {
  @override
  _StopwatchScreenState createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen>
    with SingleTickerProviderStateMixin {
  Duration _previousElapsed = Duration.zero;
  Duration _currentElapsed = Duration.zero;

  Duration get _elapsed => _previousElapsed + _currentElapsed;
  late final Ticker _ticker;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();

    _ticker = createTicker((elapsed) {
      setState(() {
        _currentElapsed = elapsed;
      });
    });
    _ticker.start();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;
      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previousElapsed += _currentElapsed;
        _currentElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _previousElapsed = Duration.zero;
      _currentElapsed = Duration.zero;
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final radius = min(constraints.maxWidth, constraints.maxHeight) / 2;
      return Stack(
        children: [
          Center(
            child: StopwatchRenderer(
              radius: radius,
              elapsed: _elapsed,
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: 80,
              height: 80,
              child: ResetButton(
                onPressed: _reset,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: 80,
              height: 80,
              child: StartStopButton(
                onPressed: _toggleRunning,
                isRunning: _isRunning,
              ),
            ),
          )
        ],
      );
    });
  }
}
