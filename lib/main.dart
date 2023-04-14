import 'package:flutter/material.dart';
import 'package:flutter_ui_screens/screens/slider/slider_home.dart';
import 'package:google_fonts/google_fonts.dart';

import 'animations/animated_container/src/pages/cuadrado_animado_page.dart';
import 'animations/stopwatch_flutter/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Screens',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0e7cfe),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      ),
      home: StopWatchHomeScreen(),
    );
  }
}
