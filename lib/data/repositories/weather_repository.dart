import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/data_providers/weather_service/weather_service.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';

abstract class WeatherRepository {
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(String phrase);

  Future<Either<GeneralError, WeatherCurrentConditions>> fetchCurrentConditions(
    String locationKey,
  );

  Future<Either<GeneralError, List<WeatherForecast>>> fetchFiveDaysForecast(
    String locationKey,
  );
}

@prodEnv
@LazySingleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherService _service;

  WeatherRepositoryImpl(this._service);

  @override
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(
    String phrase,
  ) async {
    final response = await _service.cityAutocompleteSearch(phrase);

    return response.fold(
      (error) => left(error),
      (data) => right(
        data.map(LocationAutocomplete.fromRemote).toList(),
      ),
    );
  }

  @override
  Future<Either<GeneralError, WeatherCurrentConditions>> fetchCurrentConditions(
    String locationKey,
  ) async {
    final response = await _service.fetchCurrentConditions(locationKey);

    return response.fold(
      (error) => left(error),
      (data) => right(WeatherCurrentConditions.fromRemote(data)),
    );
  }

  @override
  Future<Either<GeneralError, List<WeatherForecast>>> fetchFiveDaysForecast(
    String locationKey,
  ) async {
    final response = await _service.fetchFiveDaysForecast(locationKey);

    return response.fold(
      (error) => left(error),
      (data) => right(
        data.map(WeatherForecast.fromRemote).toList(),
      ),
    );
  }
}
