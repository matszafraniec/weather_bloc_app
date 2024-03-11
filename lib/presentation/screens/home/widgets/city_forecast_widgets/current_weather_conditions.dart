import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
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

              return CardWrapper(
                borderColor: WeatherColorHelper.obtainColor(data.icon),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CityLocationInfo(data.locationInfo),
                        WheaterIcon.big(value: data.icon),
                      ],
                    ),
                    const Divider(
                      height: Dimensions.paddingXXL,
                    ),
                    CurrentConditionsInfo(data),
                    const FavoriteIcon(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CityLocationInfo extends StatelessWidget {
  final LocationInfo location;

  const CityLocationInfo(this.location, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location.city,
            style: context.themeTexts.headlineMedium,
          ),
          Text(
            location.area,
          ),
          Text(
            location.country,
          ),
        ],
      ),
    );
  }
}

class CurrentConditionsInfo extends StatelessWidget {
  final WeatherCurrentConditions currentConditions;

  const CurrentConditionsInfo(this.currentConditions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Temperature: ${currentConditions.regularTemperature}°C',
              ),
              Text(
                'Wind: ${currentConditions.windSpeed} km/h',
              ),
            ],
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Real Feel: ${currentConditions.realFeelTemperature}°C'),
              Text('UVIndex: ${currentConditions.uvIndexText}'),
            ],
          ),
        ),
      ],
    );
  }
}

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        state as WeatherCityDataSuccess;

        return Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: IconButton(
            padding: const EdgeInsets.all(Dimensions.paddingS),
            constraints: const BoxConstraints(),
            icon: Icon(
              state.isAddedToFavorites
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: context.themeColors.error,
            ),
            onPressed: state.isAddedToFavorites
                ? null
                : () async =>
                    await context.read<WeatherCubit>().onAddToFavorites(),
          ),
        );
      },
    );
  }
}

class CardWrapper extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const CardWrapper({
    required this.child,
    required this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(
          color: borderColor,
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
        child: child,
      ),
    );
  }
}
