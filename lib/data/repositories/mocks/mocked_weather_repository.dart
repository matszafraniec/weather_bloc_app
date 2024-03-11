import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';
import 'package:weather_bloc_app/data/repositories/mocks/data.dart';
import 'package:weather_bloc_app/data/repositories/weather_repository.dart';

@mockEnv
@LazySingleton(as: WeatherRepository)
class MockedWeatherRepository extends WeatherRepository {
  final mockedData = MockedWeatherRepositoryData();

  @override
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(String phrase) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return right(mockedData.locations);
  }

  @override
  Future<Either<GeneralError, WeatherCurrentConditions>> fetchCurrentConditions(
    String locationKey,
  ) async {
    await Future.delayed(const Duration(milliseconds: 750));

    return right(mockedData.currentWeatherConditions);
  }

  @override
  Future<Either<GeneralError, List<WeatherForecast>>> fetchFiveDaysForecast(
      String locationKey) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return right(mockedData.weatherForecast);
  }
}
