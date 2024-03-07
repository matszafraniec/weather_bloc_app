// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_wind_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastWindRemote _$ForecastWindRemoteFromJson(Map<String, dynamic> json) =>
    ForecastWindRemote(
      speed: ForecastWindSpeedRemote.fromJson(
          json['Speed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastWindRemoteToJson(ForecastWindRemote instance) =>
    <String, dynamic>{
      'Speed': instance.speed.toJson(),
    };

ForecastWindSpeedRemote _$ForecastWindSpeedRemoteFromJson(
        Map<String, dynamic> json) =>
    ForecastWindSpeedRemote(
      value: (json['Value'] as num).toDouble(),
    );

Map<String, dynamic> _$ForecastWindSpeedRemoteToJson(
        ForecastWindSpeedRemote instance) =>
    <String, dynamic>{
      'Value': instance.value,
    };
