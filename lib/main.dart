import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_screens/painters/slice_painter.dart';
import 'package:flutter_ui_screens/painters/multi_border.dart';
import 'package:flutter_ui_screens/screens/loaders/full_eaample.dart';
import 'package:flutter_ui_screens/screens/slider/custom_slider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahmoud Azab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0e7cfe),
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      ),
      home:  const SlicePainterScreen()
    );
  }
}
