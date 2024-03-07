// Load data from data provider and convert to domain model. To be received from BLoC.

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/domain/location_autocomplete.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/remote/location_autocomplete_remote.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/domain/weather_forecast.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/remote/weather_forecast_remote.dart';

import '../models/weather_current_conditions/remote/weather_current_conditions_remote.dart';

abstract class WeatherRepository {
  Future<Either<GeneralError, List<LocationAutocomplete>>>
      cityAutocompleteSearch(
    String phrase,
  );

  Future<Either<GeneralError, WeatherCurrentConditions>> fetchCurrentConditions(
    String locationKey,
  );

  Future<Either<GeneralError, List<WeatherForecast>>> fetchFiveDaysForecast(
    String locationKey,
  );

  // geoposition search when tap on location button
}

class WeatherRepositoryImpl extends WeatherRepository {
  final dio = Dio();

  WeatherRepositoryImpl() {
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90,
        ),
      );
    }
  }

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

  @override
  Future<Either<GeneralError, WeatherCurrentConditions>> fetchCurrentConditions(
    String locationKey,
  ) async {
    try {
      final response = await dio.get(
        'http://dataservice.accuweather.com/currentconditions/v1/$locationKey',
        queryParameters: {
          'apikey': Environment.weatherApiKey,
          'details': true,
        },
      );

      if (response.statusCode == 200) {
        final json = (response.data as List).first;

        return right(
          WeatherCurrentConditions.fromRemote(
            WeatherCurrentConditionsRemote.fromJson(json),
          ),
        );
      }

      return left(GeneralError('Unexpected Error'));
    } on DioException catch (exception) {
      return left(GeneralError(exception.message ?? 'Unexpected Error'));
    }
  }

  @override
  Future<Either<GeneralError, List<WeatherForecast>>> fetchFiveDaysForecast(
    String locationKey,
  ) async {
    try {
      final response = await dio.get(
        'http://dataservice.accuweather.com/forecasts/v1/daily/5day/$locationKey',
        queryParameters: {
          'apikey': Environment.weatherApiKey,
          'details': true,
        },
      );

      if (response.statusCode == 200) {
        final weatherForecastObject = response.data as Map<String, dynamic>;

        final fiveDaysForecast =
            (weatherForecastObject['DailyForecasts'] as List)
                .map((json) => WeatherForecastRemote.fromJson(json['Day']))
                .map((remote) => WeatherForecast.fromRemote(remote))
                .toList();

        return right(fiveDaysForecast);
      }

      return left(GeneralError('Unexpected Error'));
    } on DioException catch (exception) {
      return left(GeneralError(exception.message ?? 'Unexpected Error'));
    }
  }
}
