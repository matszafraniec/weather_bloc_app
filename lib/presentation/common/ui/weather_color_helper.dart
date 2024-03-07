import 'package:flutter/material.dart';

class WeatherColorHelper {
  static Color obtainColor(int value) {
    if (value > 0 && value < 5) {
      return Colors.orangeAccent;
    } else {
      return Colors.blue;
    }
  }
}
