import 'package:flutter/material.dart';

import 'dart:core';

class CircularProgressb extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const CircularProgressb({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<CircularProgressb> createState() => _CircularProgressb();
}

class _CircularProgressb extends State<CircularProgressb>
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
    var paint = Paint();
    paint
      ..color = backgroundColor
      ..strokeWidth = size.width / 25
      ..style = PaintingStyle.stroke;

    for (int i = 0; i < 36; i++) {
      canvas.drawArc(
          const Offset(0.0, 0.0) & Size(size.width, size.width),
          (-90.0 + i * 10) * 0.0174533,
          8 * 0.0174533,
          false,
          paint..color = backgroundColor);

      if (i < progress / 10) {
        canvas.drawArc(
            const Offset(0.0, 0.0) & Size(size.width, size.width),
            (-90.0 + i * 10) * 0.0174533,
            8 * 0.0174533,
            false,
            paint..color = color);
      }
    }

//
//    canvas.drawArc(new Offset(0.0, 0.0)
//    &new Size(size.width, size.width), -90.0*0.0174533, progress*0.0174533,
//        false, paint..color = color);
//
//    for(int i=0; i<36; i++){
//      canvas.drawArc(new Offset(0.0, 0.0)
//      &new Size(size.width, size.width), (-90.0 + i*10-2)*0.0174533, 2*0.0174533,
//          false, paint..color = Colors.white);
//    }
  }

  @override
  bool shouldRepaint(CircularCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
