import 'package:flutter/material.dart';

import '../../common/ui/empty_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Text('This is History tab'),
        ],
      ),
    );
  }
}
