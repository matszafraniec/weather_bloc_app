// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindRemote _$WindRemoteFromJson(Map<String, dynamic> json) => WindRemote(
      speed: WindSpeedRemote.fromJson(json['Speed'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WindRemoteToJson(WindRemote instance) =>
    <String, dynamic>{
      'Speed': instance.speed.toJson(),
    };

WindSpeedRemote _$WindSpeedRemoteFromJson(Map<String, dynamic> json) =>
    WindSpeedRemote(
      metric: MetricRemote.fromJson(json['Metric'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WindSpeedRemoteToJson(WindSpeedRemote instance) =>
    <String, dynamic>{
      'Metric': instance.metric.toJson(),
    };
