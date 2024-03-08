import 'package:flutter/material.dart';
import 'package:weather_bloc_app/logic/cubits/favorite/favorite_cubit.dart';

import '../../../service_locator.dart';
import '../../common/ui/empty_app_bar.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EmptyAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is History tab'),
            ElevatedButton(
              child: const Text('Remove Favorite Cubit'),
              onPressed: () {
                final favoriteCubitInstance = locator.get<FavoriteCubit>();

                favoriteCubitInstance.close();
              },
            ),
          ],
        ),
      ),
    );
  }
}
