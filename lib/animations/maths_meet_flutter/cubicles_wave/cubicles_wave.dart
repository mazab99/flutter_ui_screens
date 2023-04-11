import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class CubiclesWave extends StatefulWidget {
  const CubiclesWave({Key? key}) : super(key: key);

  @override
  State<CubiclesWave> createState() => _CubiclesWaveState();
}

class _CubiclesWaveState extends State<CubiclesWave>
    with SingleTickerProviderStateMixin {
  late Offset offset;

  late final AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat(reverse: true);
    offset = Offset.zero;

    animationController.addListener(() {
      setState(() {});
      dev.log(animationController.value.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          setState(() {
            offset = details.localPosition;
          });
        },
        child: CustomPaint(
          painter: CubiclesWavePainter(
            // offset: offset,
            animationValue: Tween<double>(begin: 0.0, end: 1.0)
                .chain(
                  CurveTween(
                    curve: Curves.slowMiddle,
                  ),
                )
                .animate(animationController)
                .value,
          ),
          size: Size(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}

class CubiclesWavePainter extends CustomPainter {
  final double animationValue;
  CubiclesWavePainter({
    required this.animationValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    const imaginarySizeOfCubic = 20;
    final horizontalBlocks = size.width ~/ imaginarySizeOfCubic;
    final verticalBlocks = size.height ~/ imaginarySizeOfCubic;
    const maxWaveHeight = 100;
    const baseCubicSize = 10;

    for (var i = 0; i < horizontalBlocks; i++) {
      final itemValue = i / horizontalBlocks;
      const circleDiameter = 0.2;
      final isInRange = itemValue >= animationValue - circleDiameter / 2 &&
          itemValue <= animationValue + circleDiameter / 2;

      final isAhead = itemValue >= animationValue;
      final isBehind = itemValue <= animationValue;

      final blockValueWithinCircle =
          (animationValue + (circleDiameter / 2)) - itemValue;
      final highValue = !isAhead
          ? 1.0 - (blockValueWithinCircle / circleDiameter)
          : !isBehind
              ? blockValueWithinCircle / circleDiameter
              : itemValue == animationValue
                  ? 1.0
                  : 0.0;
      for (var j = 0; j < verticalBlocks; j++) {
        final randomValue = (i) / (horizontalBlocks);
        final paint = Paint()
          ..color = Colors.redAccent.withGreen(
            (255 * randomValue).toInt(),
          );
        final rect = Rect.fromLTWH(
          i * imaginarySizeOfCubic.toDouble(),
          j * imaginarySizeOfCubic -
              (isInRange ? highValue * maxWaveHeight : 0),
          baseCubicSize * highValue,
          baseCubicSize * highValue,
        );
        canvas.drawRect(
          rect,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
