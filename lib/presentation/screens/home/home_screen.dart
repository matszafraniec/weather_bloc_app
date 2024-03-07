import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubits/weather/weather_cubit.dart';
import 'widgets/city_forecast_widgets/city_forecast_layout.dart';
import 'widgets/city_search_widgets/city_search_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text('Weather'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<WeatherCubit, WeatherState>(
              builder: (context, state) => _buildBackButton(state),
            ),
            const Text(
              'This is home page',
            ),
            const SizedBox(height: 40),
            BlocConsumer<WeatherCubit, WeatherState>(
              listener: _handleSideEffects,
              builder: (context, state) {
                if (state is WeatherInitial || state is WeatherCitySearch) {
                  return const CitySearchLayout();
                } else if (state is WeatherCityData) {
                  return const CityForecastLayout();
                } else {
                  return const SizedBox();
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton(WeatherState state) {
    if (state is WeatherCityData) {
      return const CustomBackButton();
    }

    return const SizedBox();
  }

  void _handleSideEffects(BuildContext context, WeatherState state) {
    if (state is WeatherCitySearchError) {
      _snackbarError(context, state.error.message);
    } else if (state is WeatherCityDataError) {
      _snackbarError(context, state.error.message);
    }
  }

  void _snackbarError(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BackButton(
      onPressed: () => context.read<WeatherCubit>().onBackButtonPressed(),
    );
  }
}
