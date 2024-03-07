import 'package:weather_bloc_app/data/models/weather_forecast/remote/weather_forecast_remote.dart';

class WeatherForecast {
  final int icon;
  final double temperature;
  final double windSpeed;

  WeatherForecast({
    required this.icon,
    required this.temperature,
    required this.windSpeed,
  });

  factory WeatherForecast.fromRemote(WeatherForecastRemote remote) =>
      WeatherForecast(
        icon: remote.icon,
        temperature: remote.temperature.average.value,
        windSpeed: remote.wind.speed.value,
      );
}
