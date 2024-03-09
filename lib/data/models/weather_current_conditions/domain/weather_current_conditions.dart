import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/weather_current_conditions_remote.dart';

class WeatherCurrentConditions {
  final int icon;
  final double regularTemperature;
  final double realFeelTemperature;
  final double windSpeed;
  final String uvIndexText;
  late LocationInfo locationInfo;

  WeatherCurrentConditions({
    required this.icon,
    required this.regularTemperature,
    required this.realFeelTemperature,
    required this.windSpeed,
    required this.uvIndexText,
  });

  factory WeatherCurrentConditions.fromRemote(
    WeatherCurrentConditionsRemote remote,
  ) =>
      WeatherCurrentConditions(
        icon: remote.icon,
        regularTemperature: remote.temperature.metric.value,
        realFeelTemperature: remote.realFeelTemperature.metric.value,
        windSpeed: remote.wind.speed.metric.value,
        uvIndexText: remote.uvIndexText,
      );
}
