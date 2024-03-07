// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_temperature_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastTemperatureRemote _$ForecastTemperatureRemoteFromJson(
        Map<String, dynamic> json) =>
    ForecastTemperatureRemote(
      average: MetricRemote.fromJson(json['Average'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastTemperatureRemoteToJson(
        ForecastTemperatureRemote instance) =>
    <String, dynamic>{
      'Average': instance.average.toJson(),
    };
