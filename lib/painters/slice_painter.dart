import 'package:flutter/material.dart';
import 'dart:math' as math;


class SlicePainterScreen extends StatelessWidget {
  const SlicePainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahmoud Azab'),
        backgroundColor: Colors.red,
      ),
      body: CustomPaint(
        painter: SlicePainter(),
        size: const Size.fromWidth(500),
      ),
    );
  }
}

class SlicePainter extends CustomPainter {
  /// percent
  final double gap;
  final double offsetAngle;
  final int numSlices;

  SlicePainter({this.gap = 0.0, this.numSlices = 4, this.offsetAngle = 0.0});

  @override
  void paint(Canvas canvas, Size size) {
    const pi = math.pi;
    final area = Rect.fromCircle(center: size.center(Offset.zero), radius: 100);

    final stepSize = pi * 2 / numSlices;

    // final separation = 10 * pi / 180;
    final separation = stepSize * gap;

    final fill = Paint();
    fill.style = PaintingStyle.stroke;
    fill.strokeWidth = 1;

    const colors = Colors.primaries;
    for (var i = 0; i < numSlices; ++i) {
      fill.color = colors[i % colors.length];
      final startAngle = i * stepSize + separation / 2 + offsetAngle;
      final endAngle = stepSize - separation;
      canvas.drawArc(area, startAngle, endAngle, true, fill);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
