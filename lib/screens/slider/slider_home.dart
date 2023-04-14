import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/slider/slider1.dart';
import 'package:flutter_ui_screens/screens/slider/slider2.dart';

class SliderHomeScreen extends StatelessWidget {
  const SliderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Slider1(),
              Slider2(),
            ],
          ),
        ),
      ),
    );
  }
}
