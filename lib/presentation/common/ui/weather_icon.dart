import 'package:flutter/material.dart';

import 'weather_color_helper.dart';

class WheaterIcon extends StatelessWidget {
  final int value;
  final bool _isBig;

  const WheaterIcon.small({
    required this.value,
    super.key,
  }) : _isBig = false;

  const WheaterIcon.big({
    required this.value,
    super.key,
  }) : _isBig = true;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: _isBig ? 45 : 15,
      backgroundColor: _colorMapper(value),
      child: Icon(
        _iconMapper(value),
        size: _isBig ? 60 : 15,
        color: Colors.white,
      ),
    );
  }

  IconData _iconMapper(int value) {
    switch (value) {
      case > 0 && <= 5:
        return Icons.sunny;
      case > 5 && <= 8 || 38:
        return Icons.cloud;
      case > 8 && <= 11:
        return Icons.foggy;
      case > 11 && <= 29:
        return Icons.cloudy_snowing;
      case 30:
        return Icons.thermostat;
      case 31:
        return Icons.ac_unit;
      case 32:
        return Icons.air;
      default:
        return Icons.help;
    }
  }

  Color _colorMapper(int value) => WeatherColorHelper.obtainColor(value);
}
