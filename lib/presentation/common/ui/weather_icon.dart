import 'package:flutter/material.dart';

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
    if (value > 0 && value < 5) {
      return Icons.sunny;
    } else {
      return Icons.cloud;
    }
  }

  Color _colorMapper(int value) {
    if (value > 0 && value < 5) {
      return Colors.orangeAccent;
    } else {
      return Colors.blue;
    }
  }
}
