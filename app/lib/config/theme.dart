import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const _typographyLight = TextTheme(
    titleMedium: TextStyle(
      color: Color.fromRGBO(72, 72, 71, 1),
      fontWeight: FontWeight.w600,
      fontSize: 16,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(36, 35, 35, 1),
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(36, 35, 35, 1),
    ),
  );

  static const _typographyDark = TextTheme(
      titleMedium: TextStyle(
        color: Color.fromRGBO(235, 234, 234, 1),
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(237, 237, 237, 1),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(162, 161, 161, 1),
      ),
    );

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
    listTileTheme: ListTileThemeData(
      titleTextStyle: _typographyLight.labelLarge,
      subtitleTextStyle: _typographyLight.labelMedium,
    ),
    textTheme: _typographyLight,
    dividerColor: Colors.black26,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      toolbarHeight: 50,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleSpacing: 28,
      actionsIconTheme: IconThemeData(
        color: Color.fromRGBO(185, 184, 183, 1)
      ),
    ),
    scaffoldBackgroundColor: const Color.fromRGBO(46, 44, 42, 1),
    listTileTheme: ListTileThemeData(
      titleTextStyle: _typographyDark.labelLarge,
      subtitleTextStyle: _typographyDark.labelMedium,
      tileColor: const Color.fromRGBO(49, 47, 46, 1),
    ),
    textTheme: _typographyDark,
    dividerColor: Colors.black26,
  );
}