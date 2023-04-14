import 'package:flutter/material.dart';

import 'slider_ball.dart';

class Slider1 extends StatefulWidget {
  const Slider1({super.key});

  @override
  State<Slider1> createState() => _Slider1Example();
}

class _Slider1Example extends State<Slider1> {
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
                initialValue: 0,
                backgroundColor: Colors.red,
                finalValue: 250,
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
