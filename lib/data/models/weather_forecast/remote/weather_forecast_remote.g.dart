// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastRemote _$WeatherForecastRemoteFromJson(
        Map<String, dynamic> json) =>
    WeatherForecastRemote(
      icon: json['Icon'] as int,
      wind: ForecastWindRemote.fromJson(json['Wind'] as Map<String, dynamic>),
      temperature: ForecastTemperatureRemote.fromJson(
          json['WetBulbTemperature'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherForecastRemoteToJson(
        WeatherForecastRemote instance) =>
    <String, dynamic>{
      'Icon': instance.icon,
      'Wind': instance.wind.toJson(),
      'WetBulbTemperature': instance.temperature.toJson(),
    };
