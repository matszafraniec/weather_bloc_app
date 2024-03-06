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
  static const lightScheme = ColorScheme(
    primary: Colors.red,
    onPrimary: Colors.redAccent,
    secondary: Colors.black,
    onSecondary: Colors.black12,
    error: Colors.blue,
    onError: Colors.blueAccent,
    background: Colors.black12,
    onBackground: Colors.black38,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
    brightness: Brightness.light,
  );

  static const darkScheme = ColorScheme(
    primary: Colors.red,
    onPrimary: Colors.redAccent,
    secondary: Colors.black,
    onSecondary: Colors.black12,
    error: Colors.blue,
    onError: Colors.blueAccent,
    background: Colors.black12,
    onBackground: Colors.black38,
    surface: Colors.green,
    onSurface: Colors.greenAccent,
    brightness: Brightness.dark,
  );

  static const Color colorLightBackground = Colors.white;
  static const Color colorDarkBackground = Colors.white;

  static const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
  );
}
