import 'package:flutter/material.dart';

class EmptyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EmptyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kToolbarHeight);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
