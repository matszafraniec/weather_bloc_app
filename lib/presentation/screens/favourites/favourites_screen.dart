import 'package:flutter/material.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Favorites'),
      ),
      body: const Column(
        children: [
          Text('This is Favorites tab'),
        ],
      ),
    );
  }
}
