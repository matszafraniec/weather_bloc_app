// Load data from data provider and convert to domain model. To be received from BLoC.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/remote/location_autocomplete_remote.dart';

abstract class WeatherRepository {
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(
    String phrase,
  );

  // geoposition search when tap on location button

  // current conditions

  // 10 days of daily forecats for given location key when loaded current conditions
}

class WeatherRepositoryImpl extends WeatherRepository {
  Dio dio = Dio();

  @override
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(
    String phrase,
  ) async {
    try {
      final response = await dio.get(
        'http://dataservice.accuweather.com/locations/v1/cities/autocomplete',
        queryParameters: {
          'apikey': Environment.weatherApiKey,
          'q': phrase.replaceAll(' ', '')
        },
      );

      if (response.statusCode == 200) {
        final locationAutocompletes = (response.data as List)
            .map((json) => LocationAutocompleteRemote.fromJson(json))
            .map((remote) => LocationAutocomplete.fromRemote(remote))
            .toList();

        return right(locationAutocompletes);
      }

      return left(GeneralError('Unexpected Error'));
    } on DioException catch (exception) {
      return left(GeneralError(exception.message ?? 'Unexpected Error'));
    }
  }
}
