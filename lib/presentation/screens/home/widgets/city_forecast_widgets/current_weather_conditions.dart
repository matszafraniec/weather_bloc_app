import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/presentation/common/context_extensions.dart';

import '../../../../../logic/cubits/weather/weather_cubit.dart';
import '../../../../common/dimensions.dart';
import '../../../../common/ui/weather_color_helper.dart';
import '../../../../common/ui/weather_icon.dart';

class CurrentWeatherConditions extends StatelessWidget {
  const CurrentWeatherConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, opacity, child) => Opacity(
        opacity: opacity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingL),
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              final data = (state as WeatherCityDataSuccess).currentConditions;

              return Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(
                    color: WeatherColorHelper.obtainColor(
                      data.icon,
                    ),
                    width: 2,
                  ),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: Dimensions.paddingL,
                    end: Dimensions.paddingL,
                    top: Dimensions.paddingL,
                    bottom: Dimensions.paddingS,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.locationInfo.city,
                                  style: context.themeTexts.headlineMedium,
                                ),
                                Text(
                                  data.locationInfo.area,
                                ),
                                Text(
                                  data.locationInfo.country,
                                ),
                              ],
                            ),
                          ),
                          WheaterIcon.big(value: data.icon),
                        ],
                      ),
                      const Divider(
                        height: Dimensions.paddingXXL,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Temperature: ${data.regularTemperature}°C',
                                ),
                                Text(
                                  'Wind: ${data.windSpeed} km/h',
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    'Real Feel: ${data.realFeelTemperature}°C'),
                                Text('UVIndex: ${data.uvIndexText}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if (!state.isAddedToFavorites)
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: IconButton(
                            padding: const EdgeInsets.all(Dimensions.paddingS),
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              Icons.favorite,
                              color: context.themeColors.error,
                            ),
                            onPressed: () async {
                              await context
                                  .read<WeatherCubit>()
                                  .onAddToFavorites();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
