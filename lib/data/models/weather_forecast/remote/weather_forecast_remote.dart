import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/remote/forecast_wind/forecast_wind_remote.dart';

import 'forecast_temperature/forecast_temperature_remote.dart';

part 'weather_forecast_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherForecastRemote {
  @JsonKey(name: 'Icon')
  final int icon;
  @JsonKey(name: 'Wind')
  final ForecastWindSpeedRemote wind;
  @JsonKey(name: 'WetBulbTemperature')
  final ForecastTemperatureRemote temperature;

  WeatherForecastRemote({
    required this.icon,
    required this.wind,
    required this.temperature,
  });

  factory WeatherForecastRemote.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherForecastRemoteToJson(this);
}
