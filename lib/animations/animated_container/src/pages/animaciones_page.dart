import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CuadradoAnimado())
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
 late AnimationController controller;
 late Animation<double> rotacion;
 late  Animation<double> opacidad;
 late  Animation<double> moverDerecha;
 late  Animation<double> agrandar;
 late  Animation<double> fadeOut;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this, 
      duration: Duration(milliseconds: 4000)
    );

    controller.addListener(() {
      // print('Status: ${controller.status}');
      if(controller.status == AnimationStatus.completed)
        controller.repeat();
    });

    rotacion = Tween(
      begin: 0.0,
      end: 2.0 * math.pi
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    opacidad = Tween(
      begin: 0.1, 
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Interval(0, 0.25, curve: Curves.easeOut)
      )
    );

    moverDerecha = Tween(
      begin: 0.0,
      end: 200.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    agrandar = Tween(
      begin: 0.0, 
      end: 2.0,
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.easeOut
      )
    );

    fadeOut = Tween(
      begin: 1.0,
      end: 0.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Interval(
          0.75,
          1.0,
          curve: Curves.easeOut
        ),
      )
    );

    super.initState();
  }

  @override
  void dispose() { 
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller, 
      //child: _Rectagulo(),
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: fadeOut.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value, 0.0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: _Rectangulo()
                )
              )
            ),
          ),
        );
      }
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      color: Colors.blue,
    );
  }
}