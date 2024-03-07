import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';
import 'package:weather_bloc_app/presentation/common/dimensions.dart';
import 'package:weather_bloc_app/presentation/common/ui/weather_icon.dart';

import '../../../../../logic/cubits/weather/weather_cubit.dart';
import '../../../../common/ui/weather_color_helper.dart';

class WeatherForecastBuilder extends StatelessWidget {
  const WeatherForecastBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: Dimensions.paddingL),
          child: Text(
            '5 days weather forecast',
            style: context.themeTexts.labelLarge,
          ),
        ),
        BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherCityDataSuccess) {
              return _buildForecastsList(state);
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
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
    // TODO: mocked items

    // final items = [
    //   WeatherForecast(
    //     icon: 3,
    //     temperature: 20.1,
    //     windSpeed: 130,
    //   ),
    //   WeatherForecast(
    //     icon: 2,
    //     temperature: 25.1,
    //     windSpeed: 85,
    //   ),
    //   WeatherForecast(
    //     icon: 10,
    //     temperature: 13.1,
    //     windSpeed: 80,
    //   ),
    //   WeatherForecast(
    //     icon: 3,
    //     temperature: 14.1,
    //     windSpeed: 15,
    //   ),
    //   WeatherForecast(
    //     icon: 1,
    //     temperature: 15.1,
    //     windSpeed: 13,
    //   ),
    // ];

    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: Dimensions.paddingXM,
        start: Dimensions.paddingM,
        end: Dimensions.paddingM,
      ),
      child: Material(
        child: SizedBox(
          height: 100,
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              final data = (state as WeatherCityDataSuccess).fiveDaysForecast!;

              return ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: Dimensions.paddingS),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];

                  return WeatherForecastItem(item);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class WeatherForecastItem extends StatelessWidget {
  final WeatherForecast item;

  const WeatherForecastItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        side: BorderSide(
          color: WeatherColorHelper.obtainColor(item.icon),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.paddingS),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WheaterIcon.small(value: item.icon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.thermostat,
                      size: 16,
                      color: Colors.red,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 2),
                      child: RichText(
                        text: TextSpan(
                          style: context.themeTexts.bodyMedium,
                          children: [
                            TextSpan(
                              text: '${item.temperature}',
                            ),
                            TextSpan(
                              text: '°C',
                              style: context.themeTexts.bodySmall,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.air,
                      size: 16,
                      color: Colors.blue,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 2),
                      child: RichText(
                        text: TextSpan(
                          style: context.themeTexts.bodyMedium,
                          children: [
                            TextSpan(
                              text: '${item.windSpeed}',
                            ),
                            TextSpan(
                              text: ' km/h',
                              style: context.themeTexts.bodySmall,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
