// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temperature_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TemperatureRemote _$TemperatureRemoteFromJson(Map<String, dynamic> json) =>
    TemperatureRemote(
      metric: MetricRemote.fromJson(json['Metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TemperatureRemoteToJson(TemperatureRemote instance) =>
    <String, dynamic>{
      'Metric': instance.metric.toJson(),
    };
