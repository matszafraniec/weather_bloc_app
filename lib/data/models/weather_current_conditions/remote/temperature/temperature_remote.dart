import 'package:json_annotation/json_annotation.dart';

import '../metric/metric_remote.dart';

part 'temperature_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class TemperatureRemote {
  @JsonKey(name: 'Metric')
  final MetricRemote metric;

  TemperatureRemote({
    required this.metric,
  });

  factory TemperatureRemote.fromJson(Map<String, dynamic> json) =>
      _$TemperatureRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$TemperatureRemoteToJson(this);
}
