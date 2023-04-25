import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData appThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  disabledColor: Colors.white,
  indicatorColor: Colors.black,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    headlineSmall:
        GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.poppins(fontSize: 16.0),
    bodySmall: GoogleFonts.poppins(fontSize: 14.0),
    titleLarge: GoogleFonts.poppins(fontSize: 32.0),
    titleSmall:
        GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
  ),
);

final ThemeData darkAppThemeData = ThemeData(
  brightness: Brightness.dark,
  indicatorColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color.fromARGB(255, 35, 64, 150),
      foregroundColor: Colors.white),
  primaryColor: Color.fromARGB(255, 35, 64, 150),
  disabledColor: Color.fromARGB(255, 0, 0, 0),
  scaffoldBackgroundColor: Color.fromARGB(255, 13, 13, 13),
  textTheme: TextTheme(
    headlineSmall:
        GoogleFonts.poppins(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.poppins(fontSize: 18.0, fontWeight: FontWeight.bold),
    bodyMedium: GoogleFonts.poppins(fontSize: 16.0),
    bodySmall: GoogleFonts.poppins(fontSize: 14.0),
    titleSmall:
        GoogleFonts.poppins(fontSize: 20.0, fontWeight: FontWeight.w600),
    titleLarge: GoogleFonts.poppins(
        fontSize: 58.0, color: Colors.white, fontWeight: FontWeight.w700),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 35, 64, 150)),
  ),
);
