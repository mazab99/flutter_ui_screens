import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({ Key? key }) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentaje = 0.0; 
  double nuevoPorcentaje = 0.0;

  @override
  void initState() { 
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    controller.addListener(() {
      // print('valor controller: ${controller.value}');
      porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!.toDouble();
      setState(() {});
    });
    super.initState();    
  }

  @override
  void dispose() { 
    controller.dispose();  
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 300.0,
          height: 300.0,
          child: CustomPaint(
            painter: _MiRadialProgress(
              porcentaje: porcentaje
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            porcentaje = nuevoPorcentaje;
            nuevoPorcentaje += 10.0;

            if(nuevoPorcentaje > 100) {
              porcentaje = 0.0;
              nuevoPorcentaje = 0.0;
            }

            controller.forward(from: 0.0);
          });
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final porcentaje;

  _MiRadialProgress({
    this.porcentaje = 50
  });

  @override
  void paint(Canvas canvas, Size size) {
    //Circulo
    final paint = new Paint();
    paint.strokeWidth = 4.0;
    paint.color = Colors.grey;
    paint.style = PaintingStyle.stroke;

    Offset center = new Offset(size.width * 0.5, size.height / 2);
    double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    //Arco
    final paintArco = new Paint();
    paintArco.strokeWidth = 10.0;
    paintArco.color = Colors.pink;
    paintArco.style = PaintingStyle.stroke;

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