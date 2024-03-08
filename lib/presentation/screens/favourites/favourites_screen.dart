import 'package:flutter/material.dart';

import '../../common/ui/empty_app_bar.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Text('This is Favorites tab'),
        ],
      ),
    );
  }
}
