import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  ColorScheme get themeColors => Theme.of(this).colorScheme;
  TextTheme get themeTexts => Theme.of(this).textTheme;
}
