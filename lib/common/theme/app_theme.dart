import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData _themeData(ColorScheme colorScheme, bool isLightTheme) {
    final theme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.openSansTextTheme().apply(
        bodyColor: colorScheme.onBackground
      ),
    );
    return theme.copyWith(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.background,
        );
  }

  static ThemeData light(ColorScheme? dynamicColorScheme) {
    final colorScheme =
        dynamicColorScheme ?? ColorScheme.fromSeed(seedColor: Colors.white);
    return _themeData(colorScheme, true);
  }

  static ThemeData dark(ColorScheme? dynamicColorScheme) {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark, 
      seedColor: const Color(0xff131314));
    return _themeData(colorScheme, false);
  }
}
