import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData _themeData(ColorScheme colorScheme, bool isLightTheme) {
    final theme = isLightTheme ? ThemeData.light() : ThemeData.dark();
    return theme.copyWith(
      colorScheme: colorScheme,
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          
        )
      )
      );
  }

  static ThemeData light(ColorScheme? dynamicColorScheme) {
    final colorScheme =
        dynamicColorScheme ?? ColorScheme.fromSeed(seedColor: Colors.white, background: Color(0xff131314));
    return _themeData(colorScheme, true);
  }

  static ThemeData dark(ColorScheme? dynamicColorScheme) {
    final colorScheme =
        dynamicColorScheme ?? ColorScheme.fromSeed(seedColor: Color(0xff131314), );
    return _themeData(colorScheme, false);
  }
}
