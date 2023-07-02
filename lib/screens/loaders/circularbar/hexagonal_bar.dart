import 'package:flutter/material.dart';
import 'dart:core';

class HexagonalProgress extends StatefulWidget {
  final double size;
  final Color backgroundColor;
  final Color color;

  const HexagonalProgress({
    super.key,
    required this.size,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  State<HexagonalProgress> createState() => _HexagonalProgress();
}

class _HexagonalProgress extends State<HexagonalProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 5000,
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
          painter: _HexagonalCanvas(
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

class _HexagonalCanvas extends CustomPainter {
  final double progress;
  final Color backgroundColor;
  final Color color;

  _HexagonalCanvas({
    required this.progress,
    this.backgroundColor = Colors.grey,
    this.color = Colors.blue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint
      ..color = backgroundColor
      ..strokeWidth = size.width / 10
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    var path = Path();
    path.moveTo(size.width / 4 * 1, size.height / 4 * 0);
    path.lineTo(size.width / 4 * 3, size.height / 4 * 0);
    path.lineTo(size.width / 4 * 4, size.height / 4 * 1);
    path.lineTo(size.width / 4 * 4, size.height / 4 * 3);

    path.lineTo(size.width / 4 * 3, size.height / 4 * 4);
    path.lineTo(size.width / 4 * 1, size.height / 4 * 4);
    path.lineTo(size.width / 4 * 0, size.height / 4 * 3);
    path.lineTo(size.width / 4 * 0, size.height / 4 * 1);
    path.lineTo(size.width / 4 * 1, size.height / 4 * 0);

    canvas.drawPath(path, paint);

    var angle = 45;
    var pathb = Path();
    pathb.moveTo(size.width / 4 * 1, size.height / 4 * 0);

    pathb.lineTo(
        size.width / 4 * 1 +
            ((angle - progress) > 0 ? ((progress) / angle) : 1) *
                size.width /
                2,
        size.height / 4 * 0);

    if (progress > angle) {
      pathb.lineTo(
          size.width / 4 * 3 +
              ((angle * 2 - progress) > 0 ? ((progress - angle) / angle) : 1) *
                  size.width /
                  4,
          size.height / 4 * 0 +
              ((angle * 2 - progress) > 0 ? ((progress - angle) / angle) : 1) *
                  size.height /
                  4);
    }

    if (progress > angle * 2) {
      pathb.lineTo(
          size.width / 4 * 4,
          size.height / 4 * 1 +
              ((angle * 3 - progress) > 0
                      ? ((progress - angle * 2) / angle)
                      : 1) *
                  size.height /
                  2);
    }

    if (progress > angle * 3) {
      pathb.lineTo(
          size.width / 4 * 4 -
              ((angle * 4 - progress) > 0
                      ? ((progress - angle * 3) / angle)
                      : 1) *
                  size.width /
                  4,
          size.height / 4 * 3 +
              ((angle * 4 - progress) > 0
                      ? ((progress - angle * 3) / angle)
                      : 1) *
                  size.height /
                  4);
    }

    if (progress > angle * 4) {
      pathb.lineTo(
          size.width / 4 * 3 -
              ((angle * 5 - progress) > 0
                      ? ((progress - angle * 4) / angle)
                      : 1) *
                  size.width /
                  2,
          size.height / 4 * 4 +
              0 *
                  ((angle * 5 - progress) > 0
                      ? ((progress - angle * 4) / angle)
                      : 1) *
                  size.height /
                  4);
    }

    if (progress > angle * 5) {
      pathb.lineTo(
          size.width / 4 * 1 -
              ((angle * 6 - progress) > 0
                      ? ((progress - angle * 5) / angle)
                      : 1) *
                  size.width /
                  4,
          size.height / 4 * 4 -
              ((angle * 6 - progress) > 0
                      ? ((progress - angle * 5) / angle)
                      : 1) *
                  size.height /
                  4);
    }

    if (progress > angle * 6) {
      pathb.lineTo(
          size.width / 4 * 0 -
              0 *
                  ((angle * 7 - progress) > 0
                      ? ((progress - angle * 6) / 45)
                      : 1) *
                  size.width /
                  4,
          size.height / 4 * 3 -
              ((angle * 7 - progress) > 0
                      ? ((progress - angle * 6) / angle)
                      : 1) *
                  size.height /
                  2);
    }

    if (progress > angle * 7) {
      pathb.lineTo(
          size.width / 4 * 0 +
              ((angle * 8 - progress) > 0 ? ((progress - angle * 7) / 45) : 1) *
                  size.width /
                  4,
          size.height / 4 * 1 -
              ((angle * 8 - progress) > 0
                      ? ((progress - angle * 7) / angle)
                      : 1) *
                  size.height /
                  4);
    }

    Rect rect = const Offset(0.0, 0.0) & size;
    paint.shader = LinearGradient(
            colors: [Colors.yellow[500]!, Colors.red],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft)
        .createShader(rect);
    canvas.drawPath(
        pathb,
        paint
          ..color = color
          ..strokeWidth = size.width / 12);
  }

  @override
  bool shouldRepaint(_HexagonalCanvas oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
