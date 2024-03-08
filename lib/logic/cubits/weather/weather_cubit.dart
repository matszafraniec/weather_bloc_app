import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';
import 'package:weather_bloc_app/data/repositories/weather_repository.dart';

import '../../../data/repositories/favorites_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepo;
  final FavoritesRepository _favoritesRepo;

  WeatherCubit({
    required WeatherRepository weatherRepo,
    required FavoritesRepository favoritesRepo,
  })  : _weatherRepo = weatherRepo,
        _favoritesRepo = favoritesRepo,
        super(const WeatherInitial());

  Future<void> onSearchSubmitted(String searchPhrase) async {
    emit(WeatherCitySearchStart(searchPhrase));

    final response = await _weatherRepo.cityAutocompleteSearch(searchPhrase);

    response.fold(
      (error) => emit(WeatherCitySearchError(error)),
      (locations) => emit(WeatherCitySearchSuccess(locations)),
    );
  }

  Future<void> onLocationSelected(LocationAutocomplete location) async {
    emit(const WeatherCityDataLoading());

    final currentConditionsResponse =
        await _weatherRepo.fetchCurrentConditions(location.key);

    currentConditionsResponse.fold(
      (error) => emit(WeatherCityDataError(error)),
      (currentConditionsData) async {
        final currentConditionsObject = currentConditionsData
          ..locationInfo = LocationInfo(
            key: location.key,
            city: location.name,
            area: location.area,
            country: location.country,
          );

        emit(
          WeatherCityDataSuccess(
            currentConditions: currentConditionsObject,
          ),
        );

        final forecastResponse =
            await _weatherRepo.fetchFiveDaysForecast(location.key);

        forecastResponse.fold(
          (error) => emit(WeatherCityDataError(error)),
          (forecastData) {
            emit(
              WeatherCityDataSuccess(
                currentConditions: currentConditionsObject,
                fiveDaysForecast: forecastData,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> onAddToFavorites() async {
    final currentState = state as WeatherCityDataSuccess;

    final response =
        await _favoritesRepo.add(currentState.currentConditions.locationInfo);

    response.fold(
      (_) {},
      (right) {
        emit(
          WeatherCityDataSuccess(
            currentConditions: currentState.currentConditions,
            fiveDaysForecast: currentState.fiveDaysForecast,
            isAddedToFavorites: true,
          ),
        );
      },
    );
  }

  void onBackButtonPressed() => emit(const WeatherInitial());
}
