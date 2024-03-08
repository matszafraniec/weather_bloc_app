import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';
import 'package:weather_bloc_app/data/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepo;

  WeatherCubit(this._weatherRepo) : super(WeatherInitial());

  Future<void> onSearchSubmitted(String searchPhrase) async {
    emit(WeatherCitySearchStart(searchPhrase));

    final response = await _weatherRepo.cityAutocompleteSearch(searchPhrase);

    response.fold(
      (error) {
        emit(WeatherCitySearchError(error));
      },
      (data) {
        emit(WeatherCitySearchSuccess(data));
      },
    );
  }

  Future<void> onLocationSelected(LocationAutocomplete location) async {
    emit(const WeatherCityDataLoading());

    final currentConditionsResponse =
        await _weatherRepo.fetchCurrentConditions(location.key);

    currentConditionsResponse.fold(
      (error) {
        emit(WeatherCityDataError(error));
      },
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
          (error) {
            emit(WeatherCityDataError(error));
          },
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

  void onBackButtonPressed() => emit(WeatherInitial());

  Future<void> addTestValueToLocalDb() async {}
}
