import 'package:flutter/material.dart';
import 'dart:core';

class CircularProgressf extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const CircularProgressf({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<CircularProgressf> createState() => _CircularProgress();
}

class _CircularProgress extends State<CircularProgressf>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 10000,
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
            color: widget.color,
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
    var strokeWidth = size.width / 5;
    var paint = Paint();
    paint
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    Rect rect = const Offset(0.0, 0.0) & size;
    paint
      .shader = LinearGradient(
              colors: [color.withOpacity(0.5), color],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)
          .createShader(rect);

    paint.style = PaintingStyle.stroke;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        size.width / 2 - strokeWidth / 2,
        paint..color = color.withOpacity(0.3));

    canvas.drawArc(
        Offset(strokeWidth / 2, strokeWidth / 2) &
            Size(size.width - strokeWidth, size.width - strokeWidth),
        -90.0 * 0.0174533,
        progress * 0.0174533,
        false,
        paint..color = color);
  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
