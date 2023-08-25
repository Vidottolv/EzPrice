import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(231, 161, 122, 0.92),
    canvasColor: const Color.fromRGBO(231, 161, 122, 0.92),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(224, 111, 114, 1),
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white), letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      displayMedium: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      displaySmall: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      headlineLarge: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      headlineMedium: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      headlineSmall: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      titleLarge: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      titleMedium: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      bodyLarge: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      bodyMedium: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      bodySmall: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      labelLarge: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      labelMedium: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      labelSmall: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white),letterSpacing: 0.1, fontWeight: FontWeight.normal, wordSpacing: 2.0, height: 1.2),
      // headline1: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // headline2: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // headline3: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // headline4: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // headline5: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // headline6: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // subtitle1: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // subtitle2: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // bodyText1: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // bodyText2: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // caption: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // button: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
      // overline: GoogleFonts.inknutAntiqua(textStyle: const TextStyle(color: Colors.white)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromRGBO(225, 144, 99, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.white),
        ),
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static BoxDecoration backgroundDecoration = const BoxDecoration(
      color: Color.fromRGBO(231, 161, 122, 0.92),
  );
}
