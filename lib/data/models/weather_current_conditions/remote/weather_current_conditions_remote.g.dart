// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_current_conditions_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherCurrentConditionsRemote _$WeatherCurrentConditionsRemoteFromJson(
        Map<String, dynamic> json) =>
    WeatherCurrentConditionsRemote(
      icon: json['WeatherIcon'] as int,
      text: json['WeatherText'] as String,
      temperature: TemperatureRemote.fromJson(
          json['Temperature'] as Map<String, dynamic>),
      realFeelTemperature: TemperatureRemote.fromJson(
          json['RealFeelTemperature'] as Map<String, dynamic>),
      wind: WindRemote.fromJson(json['Wind'] as Map<String, dynamic>),
      uvIndexText: json['UVIndexText'] as String,
    );

Map<String, dynamic> _$WeatherCurrentConditionsRemoteToJson(
        WeatherCurrentConditionsRemote instance) =>
    <String, dynamic>{
      'WeatherIcon': instance.icon,
      'WeatherText': instance.text,
      'Temperature': instance.temperature.toJson(),
      'RealFeelTemperature': instance.realFeelTemperature.toJson(),
      'Wind': instance.wind.toJson(),
      'UVIndexText': instance.uvIndexText,
    };
