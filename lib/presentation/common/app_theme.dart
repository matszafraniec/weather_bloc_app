import 'package:flutter/material.dart';

ThemeData lightTheme() => ThemeData(
      colorScheme: AppTheme.lightScheme,
      scaffoldBackgroundColor: AppTheme.colorLightBackground,
      useMaterial3: true,
    );

ThemeData darkTheme() => ThemeData(
      colorScheme: AppTheme.darkScheme,
      canvasColor: AppTheme.colorDarkBackground,
      useMaterial3: true,
    );

class AppTheme {
  static final lightScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  );

  static final darkScheme = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  );

  static const Color colorLightBackground = Colors.white;
  static const Color colorDarkBackground = Colors.white;

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
}
