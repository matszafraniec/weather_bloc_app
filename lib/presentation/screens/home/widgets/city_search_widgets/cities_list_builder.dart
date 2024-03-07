import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';

class CitiesListBuilder extends StatelessWidget {
  const CitiesListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherCitySearchSuccess) {
          return const CitiesList();
        }

        return const SizedBox();
      },
    );
  }
}

class CitiesList extends StatelessWidget {
  const CitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherCitySearchSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.autocompletes.length,
            itemBuilder: (context, index) {
              final item = state.autocompletes[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.area),
                trailing: Text(item.country),
                onTap: () async =>
                    await context.read<WeatherCubit>().onLocationSelected(item),
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
