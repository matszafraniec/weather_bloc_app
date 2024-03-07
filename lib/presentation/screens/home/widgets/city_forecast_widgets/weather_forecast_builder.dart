import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../logic/cubits/weather/weather_cubit.dart';

class WeatherForecastBuilder extends StatelessWidget {
  const WeatherForecastBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherCityDataSuccess) {
          return _buildForecastsList(state);
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _buildForecastsList(WeatherCityDataSuccess state) {
    if (state.fiveDaysForecast == null) {
      return const CircularProgressIndicator();
    } else {
      return const WeatherForecastList();
    }
  }
}

class WeatherForecastList extends StatelessWidget {
  const WeatherForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('This is Weather Forecast List');
  }
}
