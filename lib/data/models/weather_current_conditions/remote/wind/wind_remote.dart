import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/metric/metric_remote.dart';

part 'wind_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class WindRemote {
  @JsonKey(name: 'Speed')
  final WindSpeedRemote speed;

  WindRemote({required this.speed});

  factory WindRemote.fromJson(Map<String, dynamic> json) =>
      _$WindRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$WindRemoteToJson(this);
}

@JsonSerializable(explicitToJson: true)
class WindSpeedRemote {
  @JsonKey(name: 'Metric')
  final MetricRemote metric;

  WindSpeedRemote({required this.metric});

  factory WindSpeedRemote.fromJson(Map<String, dynamic> json) =>
      _$WindSpeedRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$WindSpeedRemoteToJson(this);
}
