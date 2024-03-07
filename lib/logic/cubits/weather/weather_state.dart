part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {}

final class WeatherCitySearchStart extends WeatherState {
  final String searchPhrase;

  const WeatherCitySearchStart(this.searchPhrase);
}

final class WeatherCitySearchSuccess extends WeatherState {
  final List<LocationAutocomplete> autocompletes;

  const WeatherCitySearchSuccess(this.autocompletes);
}

final class WeatherCitySearchError extends WeatherState {
  final GeneralError error;

  const WeatherCitySearchError(this.error);
}

final class WeatherDataLoading extends WeatherState {
  const WeatherDataLoading();
}

final class WeatherDataError extends WeatherState {
  final GeneralError error;

  const WeatherDataError(this.error);
}

final class WeatherDataSuccess extends WeatherState {
  final WeatherCurrentConditions currentConditions;
  final List<WeatherForecast>? fiveDaysForecast;

  const WeatherDataSuccess({
    required this.currentConditions,
    this.fiveDaysForecast,
  });
}
