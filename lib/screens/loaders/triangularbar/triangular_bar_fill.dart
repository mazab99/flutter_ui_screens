import 'package:flutter/material.dart';

import 'dart:core';

class TriangularProgressFill extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const TriangularProgressFill({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<TriangularProgressFill> createState() => _TriangularProgress();
}

class _TriangularProgress extends State<TriangularProgressFill>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10000))
      ..repeat();
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
          painter: _TriangularCanvas(
              progress: animation.value,
              backgroundColor: widget.backgroundColor,
              color: widget.color),
          size: Size(
            widget.size,
            widget.size,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: widget.size / 4),
          child: Text(
            '${(animation.value / 360 * 100).round()}%',
            style: TextStyle(
              color: Colors.white,
              fontSize: widget.size / 5,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class _TriangularCanvas extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color color;

  _TriangularCanvas({
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

    var path = Path();
    path.moveTo(size.width / 2, size.height * 0);
    path.lineTo(size.width * 0, size.height * 1);
    path.lineTo(size.width * 1, size.height * 1);

    canvas.drawPath(path, paint);

    Rect rect = const Offset(0.0, 0.0) & size;

    paint.shader = LinearGradient(
            colors: [Colors.yellow[500]!, Colors.red],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter)
        .createShader(rect);

    var pathFill = Path();
    pathFill.moveTo(size.width * 0, size.height * 1);
    pathFill.lineTo(size.width * 1, size.height * 1);
    pathFill.lineTo(size.width * 1 - size.width / 2 * progress / 360,
        size.height * 1 - size.height * progress / 360);
    pathFill.lineTo(size.width * 0 + size.width / 2 * progress / 360,
        size.height * 1 - size.height * progress / 360);
    canvas.drawPath(pathFill, paint);
  }

  @override
  bool shouldRepaint(_TriangularCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
