import 'package:json_annotation/json_annotation.dart';

part 'metric_remote.g.dart';

@JsonSerializable()
class MetricRemote {
  @JsonKey(name: 'Value')
  final double value;

  MetricRemote({
    required this.value,
  });

  factory MetricRemote.fromJson(Map<String, dynamic> json) =>
      _$MetricRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$MetricRemoteToJson(this);
}
