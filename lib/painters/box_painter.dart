import 'package:flutter/material.dart';

class BoxPainterScreen extends StatelessWidget {
  const BoxPainterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahmoud Azab'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: CustomPaint(
          painter: BoxPainter(),
          size: const Size.fromWidth(300),
        ),
      ),
    );
  }
}

class BoxPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.red
      // ..style = PaintingStyle.stroke // enalbe for understand purpose
      ..strokeCap = StrokeCap.round;
    Path path = Path();

    final cornerCurve = size.width * .1;
    final topCurveHeight = size.height * .1;

    path.moveTo(
      0,
      cornerCurve + topCurveHeight,
    ); //move little down + topCurve spaces
    path.lineTo(
      0,
      size.height * .9,
    ); // draw left line

    path.quadraticBezierTo(
      0,
      size.height,
      cornerCurve,
      size.height,
    ); //bottom-left corner

    path.lineTo(size.width - cornerCurve, size.height); // bottom line

    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - cornerCurve,
    ); // bottom right corner

    path.lineTo(
      size.width,
      cornerCurve + topCurveHeight,
    ); // left line

    //* topRightCorner:  without getting topCurve spaces
    path.quadraticBezierTo(
      size.width,
      topCurveHeight,
      size.width - cornerCurve,
      topCurveHeight,
    );

    //* moving the draw point to get better understanding
    path.moveTo(0, topCurveHeight + cornerCurve);

    //* topLeftCorner:  without getting topCurve spaces
    path.quadraticBezierTo(0, topCurveHeight, cornerCurve, topCurveHeight);

    //**TOP level Curve */
    path.quadraticBezierTo(
      size.width / 2,
      -topCurveHeight * .9, // curve little more
      size.width - cornerCurve,
      topCurveHeight,
    );

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
