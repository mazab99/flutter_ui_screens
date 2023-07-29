// ignore_for_file: non_constant_identifier_names

import 'dart:math' as math;
import 'package:flutter/material.dart';

class MultiBorderScreen extends StatefulWidget {
  const MultiBorderScreen({Key? key}) : super(key: key);

  @override
  _MultiBorderScreenState createState() => _MultiBorderScreenState();
}

class _MultiBorderScreenState extends State<MultiBorderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Mahmoud Azab'),
          backgroundColor:Colors.red,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: CircleBorderWith4Color(
              gap: 0,
              borderThinckness: 5,
              bottomLeftColor: Colors.yellow,
              bottomRightColor: Colors.green,
              topLeftColor: Colors.purple,
              topRightColor: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

double deg2rad(double deg) => deg * math.pi / 180;

double rad2deg(double rad) => rad * 180 / math.pi;

class CircleBorderWith4Color extends CustomPainter {
  final double borderThinckness;
  final double gap;

  final Color bottomRightColor;
  final Color bottomLeftColor;
  final Color topRightColor;
  final Color topLeftColor;

  CircleBorderWith4Color({
    required this.gap,
    required this.borderThinckness,
    required this.bottomLeftColor,
    required this.bottomRightColor,
    required this.topLeftColor,
    required this.topRightColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    Paint paint_TR = Paint()
      ..color = topRightColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThinckness;

    Paint paint_BR = Paint()
      ..color = bottomRightColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThinckness;

    Paint paint_BL = Paint()
      ..color = bottomLeftColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThinckness;

    Paint paint_TL = Paint()
      ..color = topLeftColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderThinckness;

    ///Bottom Right:: ok
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(0 + gap),
        deg2rad(90 - (gap * 2)),
        false,
        paint_BR);

    ///BottomLeft :: Ok
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(90 + gap),
        deg2rad(90 - (gap * 2)),
        false,
        paint_BL);

    // /TopLeft
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(180 + gap),
        deg2rad(90 - (gap * 2)),
        false,
        paint_TL);

    ///Top Right :: OK
    canvas.drawArc(
        Rect.fromCenter(center: center, width: size.width, height: size.height),
        deg2rad(270 + gap),
        deg2rad(90 - (gap * 2)),
        false,
        paint_TR);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
