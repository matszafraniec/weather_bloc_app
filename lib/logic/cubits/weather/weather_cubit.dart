import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
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
}
