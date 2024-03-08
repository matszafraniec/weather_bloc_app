part of 'weather_cubit.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

final class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

final class WeatherCitySearch extends WeatherState {
  const WeatherCitySearch();
}

final class WeatherCityData extends WeatherState {
  const WeatherCityData();
}

// Weather City Search states

final class WeatherCitySearchStart extends WeatherCitySearch {
  final String searchPhrase;

  const WeatherCitySearchStart(this.searchPhrase);
}

final class WeatherCitySearchSuccess extends WeatherCitySearch {
  final List<LocationAutocomplete> autocompletes;

  const WeatherCitySearchSuccess(this.autocompletes);
}

final class WeatherCitySearchError extends WeatherCitySearch {
  final GeneralError error;

  const WeatherCitySearchError(this.error);
}

// Weather City Data states

final class WeatherCityDataLoading extends WeatherCityData {
  const WeatherCityDataLoading();
}

final class WeatherCityDataError extends WeatherCityData {
  final GeneralError error;

  const WeatherCityDataError(this.error);
}

final class WeatherCityDataSuccess extends WeatherCityData {
  final WeatherCurrentConditions currentConditions;
  final List<WeatherForecast>? fiveDaysForecast;
  final bool isAddedToFavorites;

  const WeatherCityDataSuccess({
    required this.currentConditions,
    this.fiveDaysForecast,
    this.isAddedToFavorites = false,
  });

  @override
  List<Object> get props => [
        currentConditions,
        fiveDaysForecast ?? [],
        isAddedToFavorites,
      ];
}
