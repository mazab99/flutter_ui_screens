import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_screens/screens/floating%20dialog/moveable_dialog_example.dart';
import 'package:flutter_ui_screens/screens/info%20dialog/custom_dialog_example.dart';
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
      home:  const MoveableDialogScreen(),
    );
  }
}
