import 'package:flutter/material.dart';

import 'bubble.dart';

class BubbleButtonPage extends StatelessWidget {
  final double size = 40.0;

  const BubbleButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BubbleButton(
            size: size,
            onTap: (bool isBubbled) async => !isBubbled,
            bubbleBuilder: (bool isBubbled) => Icon(
              Icons.ac_unit,
              size: size,
              color: isBubbled ? Colors.red : Colors.black38,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          BubbleButton(
            size: size,
            circleColor: const CircleColor(
              start: Color(0xff00ddff),
              end: Color(0xff0099cc),
            ),
            bubbleColor: const BubbleColor(
              dotFirstColor: Color(0xff33b5e5),
              dotSecondColor: Color(0xff0099cc),
            ),
            bubbleBuilder: (bool value) => Icon(
              Icons.error,
              color: value ? Colors.deepPurpleAccent : Colors.grey,
              size: size,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          BubbleButton(
            size: size,
            circleColor: const CircleColor(
              start: Color(0xff669900),
              end: Color(0xff669900),
            ),
            bubbleColor: const BubbleColor(
              dotFirstColor: Color(0xff669900),
              dotSecondColor: Color(0xff99cc00),
            ),
            bubbleBuilder: (bool value) => Icon(
              Icons.add_alert_outlined,
              color: value ? Colors.green : Colors.grey,
              size: size,
            ),
          ),
        ],
      ),
    );
  }
}
