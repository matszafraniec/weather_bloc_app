import 'package:json_annotation/json_annotation.dart';

part 'forecast_wind_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastWindRemote {
  @JsonKey(name: 'Speed')
  final ForecastWindSpeedRemote speed;

  ForecastWindRemote({required this.speed});

  factory ForecastWindRemote.fromJson(Map<String, dynamic> json) =>
      _$ForecastWindRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastWindRemoteToJson(this);
}

@JsonSerializable()
class ForecastWindSpeedRemote {
  @JsonKey(name: 'Value')
  final double value;

  ForecastWindSpeedRemote({
    required this.value,
  });

  factory ForecastWindSpeedRemote.fromJson(Map<String, dynamic> json) =>
      _$ForecastWindSpeedRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastWindSpeedRemoteToJson(this);
}
