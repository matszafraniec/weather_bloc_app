import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

class ErrorIconBig extends StatelessWidget {
  const ErrorIconBig({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.warning,
        color: context.themeColors.error,
        size: 90,
      ),
    );
  }
}
