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
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: Dimensions.paddingXM,
        start: Dimensions.paddingM,
        end: Dimensions.paddingM,
      ),
      child: Material(
        child: SizedBox(
          height: 100,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 600),
            builder: (context, opacity, child) => Opacity(
              opacity: opacity,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (context, state) {
                  final data =
                      (state as WeatherCityDataSuccess).fiveDaysForecast!;

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
