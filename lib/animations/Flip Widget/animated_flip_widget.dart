import 'dart:math';

import 'package:flutter/material.dart';

//AnimatedFlipWidget(
//           color: Colors.white,
//           backgroundColor: Colors.red,
//           leftLabel: 'Photo',
//           rightLabel: 'Video',
//           onChange: ((isLeftActive) {}),
//         ),
class AnimatedFlipWidget extends StatefulWidget {
  final Color color;
  final Color backgroundColor;
  final String leftLabel;
  final String rightLabel;
  final Function(bool isLeftActive)? onChange;

  const AnimatedFlipWidget({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.leftLabel,
    required this.rightLabel,
    this.onChange,
  });

  @override
  State<AnimatedFlipWidget> createState() => _AnimatedFlipWidgetState();
}

class _AnimatedFlipWidgetState extends State<AnimatedFlipWidget>
    with TickerProviderStateMixin {
  final double _maxTiltAngle = pi / 6;
  AnimationController? _flipController;
  AnimationController? _tiltController;
  Animation? _tiltAnimation;
  double directionMultiplier = 1;

  @override
  void initState() {
    super.initState();
    _tiltController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 1500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _tiltController!.reverse();
        }
      });
    _tiltAnimation = CurvedAnimation(
      parent: _tiltController!,
      curve: Curves.easeOut,
      reverseCurve: Curves.elasticOut.flipped,
    );

    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _jumpToMode(true);
  }

  @override
  void dispose() {
    super.dispose();
    _flipController!.dispose();
    _tiltController!.dispose();
  }

  void _jumpToMode(bool leftEnable) {
    _flipController!.value = leftEnable ? 1.0 : 0.0;
  }

  void _flipSwitch() {
    if (_flipController!.isCompleted) {
      directionMultiplier = 1;
      _tiltController!.forward();

      _flipController!.reverse();
      widget.onChange?.call(false);
    } else {
      directionMultiplier = -1;
      _tiltController!.forward();
      _flipController!.forward();
      widget.onChange?.call(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _tiltAnimation!,
      builder: (ctx, child) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(
              _tiltAnimation!.value * _maxTiltAngle * directionMultiplier,
            ),
          alignment: const FractionalOffset(0.5, 1.0),
          child: child,
        );
      },
      child: Stack(
        children: [
          _buildTabBackground(),
          AnimatedBuilder(
            animation: _flipController!,
            builder: (context, snapshot) {
              return _buildFlippingSwitch(pi * _flipController!.value);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFlippingSwitch(double angle) {
    final isLeft = angle > (pi / 2);
    final transformAngle = isLeft ? angle - pi : angle;

    return Positioned(
      top: 0,
      bottom: 0,
      right: isLeft ? null : 0,
      left: isLeft ? 0 : null,
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(transformAngle),
        alignment: isLeft
            ? const FractionalOffset(1.0, 1.0)
            : const FractionalOffset(0.0, 1.0),
        child: Container(
          width: 125,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: isLeft ? Radius.zero : const Radius.circular(32),
                bottomRight: isLeft ? Radius.zero : const Radius.circular(32),
                topLeft: isLeft ? const Radius.circular(32) : Radius.zero,
                bottomLeft: isLeft ? const Radius.circular(32) : Radius.zero,
              ),
              border: Border.all(width: 2, color: Colors.red),
              color: widget.color),
          child: Center(
            child: Text(
              isLeft ? widget.leftLabel : widget.rightLabel,
              style: TextStyle(
                color: widget.backgroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTabBackground() {
    return GestureDetector(
      onTap: _flipSwitch,
      child: Container(
        width: 250,
        height: 50,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(32.0),
          border: Border.all(width: 2, color: Colors.red),
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                  child: Text(
                widget.leftLabel,
                style: TextStyle(
                  color: widget.color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )),
            ),
            Expanded(
              child: Center(
                child: Text(
                  widget.rightLabel,
                  style: TextStyle(
                    color: widget.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
