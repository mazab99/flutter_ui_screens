import 'package:flutter/material.dart';
import 'dart:core';

class CircularProgressc extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const CircularProgressc({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<CircularProgressc> createState() => _CircularProgressc();
}

class _CircularProgressc extends State<CircularProgressc>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
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
    var paint = Paint();
    paint
      ..color = backgroundColor
      ..strokeWidth = 1.0 //size.width/50
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);

    paint.strokeWidth = size.width / 15;
    canvas.drawArc(const Offset(0.0, 0.0) & Size(size.width, size.width),
        -90.0 * 0.0174533, progress * 0.0174533, false, paint..color = color);
  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
