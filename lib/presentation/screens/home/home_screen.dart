import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/screens/home/widgets/cities_list_builder.dart';

import 'widgets/city_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Weather'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This is home page',
            ),
            SizedBox(height: 40),
            CitySearchBar(),
            CitiesListBuilder(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
