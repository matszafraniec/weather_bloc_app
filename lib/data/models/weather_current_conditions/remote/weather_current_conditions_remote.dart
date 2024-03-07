import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/wind/wind_remote.dart';

import 'temperature/temperature_remote.dart';

part 'weather_current_conditions_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherCurrentConditionsRemote {
  @JsonKey(name: 'WeatherIcon')
  final int icon;
  @JsonKey(name: 'WeatherText')
  final String text;
  @JsonKey(name: 'Temperature')
  final TemperatureRemote temperature;
  @JsonKey(name: 'RealFeelTemperature')
  final TemperatureRemote realFeelTemperature;
  @JsonKey(name: 'Wind')
  final WindRemote wind;
  @JsonKey(name: 'UVIndexText')
  final String uvIndexText;

  WeatherCurrentConditionsRemote({
    required this.icon,
    required this.text,
    required this.temperature,
    required this.realFeelTemperature,
    required this.wind,
    required this.uvIndexText,
  });

  factory WeatherCurrentConditionsRemote.fromJson(Map<String, dynamic> json) =>
      _$WeatherCurrentConditionsRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherCurrentConditionsRemoteToJson(this);
}
