import 'package:flutter/material.dart';

class CustomSliderScreen extends StatelessWidget {
  const CustomSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahmoud Azab'),
        backgroundColor: Colors.red,
      ),
      body: CustomPaint(
        painter: CustomSlider(value: 100),
        size: const Size.fromWidth(500),
      ),
    );
  }
}

class CustomSlider extends CustomPainter {
  final double value;

  final double gapPercentage = .02;
  final double circleRadius = 10;

  CustomSlider({
    required this.value,
  });

  Color circleColor() {
    if (value <= .25) {
      return Colors.green;
    } else if (value <= .5) {
      return Colors.blue;
    } else if (value <= .75) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    double dCY = size.height / 2;

    Paint paint = Paint()
      ..color = Colors.green
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    canvas.drawLine(
        Offset(0, dCY), Offset(size.width * (.25 - gapPercentage), dCY), paint);
    canvas.drawLine(
        Offset(size.width * .25, dCY),
        Offset(size.width * (.5 - gapPercentage), dCY),
        paint..color = Colors.blue);
    canvas.drawLine(
        Offset(size.width * .5, dCY),
        Offset(size.width * (.75 - gapPercentage), dCY),
        paint..color = Colors.yellow);
    canvas.drawLine(
        Offset(size.width * .75, dCY),

        /// you can ignore it here
        Offset(size.width * (1 - gapPercentage), dCY),
        paint..color = Colors.red);

    canvas.drawCircle(
      Offset(size.width * value, dCY),
      circleRadius,
      paint
        ..style = PaintingStyle.fill
        ..color = circleColor(),
    );

    final textPainter = TextPainter(
      text: const TextSpan(
        text: '18.5',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter.paint(canvas, Offset(size.width * .2, dCY * .7));

    final textPainter2 = TextPainter(
      text: const TextSpan(
        text: '25',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter2.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter2.paint(canvas, Offset(size.width * .47, dCY * .7));

    final textPainter3 = TextPainter(
      text: const TextSpan(
        text: '30',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 18,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter3.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter3.paint(canvas, Offset(size.width * .72, dCY * .7));

    ///bottom Text
    final textPainter4 = TextPainter(
      text: const TextSpan(
        text: 'Text 1',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter4.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter4.paint(canvas, Offset(size.width * .1, dCY * 1.1));

    final textPainter5 = TextPainter(
      text: const TextSpan(
        text: 'Text 2',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter5.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter5.paint(canvas, Offset(size.width * .3, dCY * 1.1));

    final textPainter6 = TextPainter(
      text: const TextSpan(
        text: 'Text 3',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter6.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter6.paint(canvas, Offset(size.width * .57, dCY * 1.1));

    final textPainter7 = TextPainter(
      text: const TextSpan(
        text: 'Text 4',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter7.layout(
      minWidth: 0,
      maxWidth: size.width * .25,
    );
    textPainter7.paint(canvas, Offset(size.width * .82, dCY * 1.1));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
