import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/weather_current_conditions_remote.dart';

class WeatherCurrentConditions {
  final int icon;
  final double regularTemperature;
  final double realFeelTemperature;
  final double windSpeed;
  final String uvIndexTest;
  late LocationInfo locationInfo;

  WeatherCurrentConditions({
    required this.icon,
    required this.regularTemperature,
    required this.realFeelTemperature,
    required this.windSpeed,
    required this.uvIndexTest,
  });

  factory WeatherCurrentConditions.fromRemote(
          WeatherCurrentConditionsRemote remote) =>
      WeatherCurrentConditions(
        icon: remote.icon,
        regularTemperature: remote.temperature.metric.value,
        realFeelTemperature: remote.realFeelTemperature.metric.value,
        windSpeed: remote.wind.speed.metric.value,
        uvIndexTest: remote.uvIndexText,
      );

  factory WeatherCurrentConditions.fromMap(Map<String, dynamic> map) {
    final object = WeatherCurrentConditions(
      icon: map['icon'] as int,
      regularTemperature: map['regularTemperature'] as double,
      realFeelTemperature: map['realFeelTemperature'] as double,
      windSpeed: map['windSpeed'] as double,
      uvIndexTest: map['uvIndexTest'] as String,
    );

    final locationInfo = map['locationInfo'] as Map<String, dynamic>;

    object.locationInfo = LocationInfo(
      key: locationInfo['key'],
      city: locationInfo['city'],
      area: locationInfo['area'],
      country: locationInfo['country'],
    );

    return object;
  }

  // Map<String, dynamic> toMap() => {
  //       'icon': icon,
  //       'regularTemperature': regularTemperature,
  //       'realFeelTemperature': regularTemperature,
  //       'windSpeed': windSpeed,
  //       'uvIndexTest': uvIndexTest,
  //       'locationInfo': {
  //         'key': locationInfo.key,
  //         'city': locationInfo.city,
  //         'area': locationInfo.area,
  //         'country': locationInfo.country,
  //       }
  //     };
}
