import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/cubits/weather/weather_cubit.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/ui/error_icon_big.dart';
import 'current_weather_conditions.dart';
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
            return const ProgressIndicator();
          } else if (state is WeatherCityDataSuccess) {
            return const Column(
              children: [
                CurrentWeatherConditions(),
                WeatherForecastBuilder(),
              ],
            );
          } else if (state is WeatherCityDataError) {
            return const ErrorIconBig();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
