import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/screens/home/widgets/city_search_widgets/cities_list_builder.dart';
import 'package:weather_bloc_app/presentation/screens/home/widgets/city_search_widgets/city_search_bar.dart';

class CitySearchLayout extends StatelessWidget {
  const CitySearchLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CitySearchBar(),
        CitiesListBuilder(),
      ],
    );
  }
}
