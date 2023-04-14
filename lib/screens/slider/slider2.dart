import 'package:flutter/material.dart';

import 'slider_ball.dart';

class Slider2 extends StatefulWidget {
  const Slider2({super.key});

  @override
  State<Slider2> createState() => _Slider2Example();
}

class _Slider2Example extends State<Slider2> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              height: 180,
              child: SliderBall(
                initialValue: 20,
                finalValue: 40,
                backgroundColor: Colors.black87,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                onSelectStart: () {
                  setState(() {
                    visible = false;
                  });
                },
                onSelectEnd: (value) {
                  setState(() {
                    visible = true;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
