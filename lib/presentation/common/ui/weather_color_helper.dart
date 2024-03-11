import 'package:flutter/material.dart';

class WeatherColorHelper {
  static Color obtainColor(int value) {
    switch (value) {
      case > 0 && <= 5:
        return Colors.orangeAccent;
      case > 5 && <= 8:
        return Colors.blue;
      case > 8 && <= 11:
        return Colors.grey;
      case > 11 && <= 29:
        return Colors.blueGrey;
      case 30:
        return Colors.red;
      case 31:
        return Colors.blueAccent;
      case 32:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
