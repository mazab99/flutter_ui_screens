import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorColorPrimario;
  final double grosorColorSecundario;

  RadialProgress({
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey, 
    this.grosorColorPrimario = 10.0, 
    this.grosorColorSecundario = 4.0
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentajeAnterior = 0.0;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior; 
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              porcentaje: (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario,
              grosorColorPrimario: widget.grosorColorPrimario,
              grosorColorSecundario: widget.grosorColorSecundario
            )
          )
        );
      }
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;
  final colorPrimario;
  final colorSecundario;
  final grosorColorPrimario;
  final grosorColorSecundario;

  _MiRadialProgress({
    this.porcentaje = 50,
    this.colorPrimario,
    this.colorSecundario,
    this.grosorColorPrimario,
    this.grosorColorSecundario
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromCircle(
      center: Offset(0, 0), 
      radius: 180.0
    );

    final Gradient gradient = new LinearGradient(
      colors: <Color> [
        Color(0XFFC012FF),
        Color(0XFF6D05E8),
        Colors.red,
      ]
    );

    //Circulo
    final paint = new Paint();
    paint.strokeWidth = this.grosorColorSecundario;
    paint.color = this.colorSecundario;
    paint.style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = new Paint();
    paintArco.strokeWidth = this.grosorColorPrimario;
    // paintArco.color = this.colorPrimario;
    paintArco.shader = gradient.createShader(rect);
    paintArco.style = PaintingStyle.stroke;
    paintArco.strokeCap = StrokeCap.round;

    double arcAngle = 2 * pi * (porcentaje / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}