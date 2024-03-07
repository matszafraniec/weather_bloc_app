import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/metric/metric_remote.dart';

part 'forecast_temperature_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastTemperatureRemote {
  @JsonKey(name: 'Average')
  final MetricRemote average;

  ForecastTemperatureRemote({
    required this.average,
  });

  factory ForecastTemperatureRemote.fromJson(Map<String, dynamic> json) =>
      _$ForecastTemperatureRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastTemperatureRemoteToJson(this);
}
