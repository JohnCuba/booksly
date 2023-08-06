import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleSpacing: 28,
      actionsIconTheme: IconThemeData(
        color: Color.fromRGBO(72, 72, 71, 1)
      ),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(237, 236, 236, 1),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Color.fromRGBO(72, 72, 71, 1),
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      )
    ),
    dividerColor: Colors.black26,
  );
}