import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

class DialogHelper {
  final BuildContext _context;

  DialogHelper.of(this._context);

  void show({
    required String title,
    String? message,
    IconData? icon,
  }) =>
      showDialog(
        context: _context,
        builder: (context) => AlertDialog(
          icon: Icon(
            icon ?? Icons.warning,
            color: context.themeColors.primary,
            size: 50,
          ),
          title: Text(
            title,
            style: context.themeTexts.bodyLarge,
          ),
          content: message == null
              ? const SizedBox.shrink()
              : Text(
                  message,
                ),
          actions: [
            ElevatedButton(
              onPressed: context.pop,
              child: const Text('OK'),
            )
          ],
        ),
      );
}
