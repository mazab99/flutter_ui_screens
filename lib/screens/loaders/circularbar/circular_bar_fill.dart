import 'package:flutter/material.dart';

import 'dart:core';

class CircularProgressFill extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const CircularProgressFill({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<CircularProgressFill> createState() => _CircularProgress();
}

class _CircularProgress extends State<CircularProgressFill>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 20000,
      ),
    )..repeat();
    animation = Tween(begin: 0.0, end: 360.0).animate(controller);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CustomPaint(
          painter: CircularCanvas(
              progress: animation.value,
              backgroundColor: widget.backgroundColor,
              color: widget.color),
          size: Size(widget.size, widget.size),
        ),
        Text(
          '${(animation.value / 360 * 100).round()}%',
          style: TextStyle(
            color: Colors.white,
            fontSize: widget.size / 5,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class CircularCanvas extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color color;

  CircularCanvas({
    required this.progress,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
      ..color = backgroundColor
      ..strokeWidth = size.width / 20
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
    var path = Path();
    path.moveTo(0.0, size.height / 2);
    path.lineTo(size.width / 2, size.height / 2);

    Rect rect = const Offset(0.0, 0.0) & size;
    path.addArc(rect, (90.0 - progress / 2 + (progress % 3) * 2) * 0.0174533,
        progress * 0.0174533);

    paint.shader = LinearGradient(
            colors: [Colors.yellow[500]!, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)
        .createShader(rect);
    canvas.drawPath(
        path,
        paint
          ..color = Colors.red
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
