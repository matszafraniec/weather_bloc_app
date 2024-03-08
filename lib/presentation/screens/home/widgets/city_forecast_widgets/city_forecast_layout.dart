import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';
import 'package:weather_bloc_app/presentation/screens/home/widgets/city_forecast_widgets/current_weather_conditions.dart';

import '../../../../../logic/cubits/weather/weather_cubit.dart';
import 'weather_forecast_builder.dart';

class CityForecastLayout extends StatelessWidget {
  const CityForecastLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Dimensions.paddingL),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherCityDataLoading) {
            return const Align(
              alignment: Alignment.topCenter,
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherCityDataSuccess) {
            return const Column(
              children: [
                CurrentWeatherConditions(),
                WeatherForecastBuilder(),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
