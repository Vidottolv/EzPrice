import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: const Color.fromRGBO(231, 161, 122, 0.92),
    canvasColor: const Color.fromRGBO(231, 161, 122, 0.92),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(224, 111, 114, 1),
      centerTitle: true,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      bodyMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      displayLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      displayMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      displaySmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      headlineMedium: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      headlineSmall: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Inknut Antiqua'),
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
    fontFamily: 'Inknut Antiqua',
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static BoxDecoration backgroundDecoration = const BoxDecoration(
      color: Color.fromRGBO(231, 161, 122, 0.92),
  );
}
