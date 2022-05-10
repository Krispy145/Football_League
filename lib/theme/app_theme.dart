import 'package:flutter/material.dart';

class AppTheme {
  //Colors
  static Color primary = Colors.teal;
  static Color? secondary = Colors.yellow[600];

  //Theme
  static ThemeData lightTheme() {
    TextTheme _customLightThemesTextTheme(TextTheme base) {
      return base.copyWith(
        bodyText2: base.bodyText2?.copyWith(color: Colors.black),
      );
    }

    final ThemeData lightTheme = ThemeData.light();
    return lightTheme.copyWith(
      textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    );
  }

  static ThemeData darkTheme() {
    TextTheme _customDarkThemesTextTheme(TextTheme base) {
      return base.copyWith(
        bodyText2: base.bodyText2?.copyWith(color: Colors.white),
      );
    }

    final ThemeData darkTheme = ThemeData.dark();
    return darkTheme.copyWith(
      textTheme: _customDarkThemesTextTheme(darkTheme.textTheme),
    );
  }
}
