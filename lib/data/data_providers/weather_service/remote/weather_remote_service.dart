import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/weather_current_conditions_remote.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/remote/weather_forecast_remote.dart';

import '../../../models/location_autocomplete/remote/location_autocomplete_remote.dart';

@prodEnv
@LazySingleton()
class WeatherRemoteService {
  final _dio = Dio();
  static const _baseUrl = 'http://dataservice.accuweather.com';

  WeatherRemoteService() {
    if (kDebugMode) {
      _dio.interceptors.add(
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

  Future<Either<GeneralError, List<LocationAutocompleteRemote>>>
      cityAutocompleteSearch(String phrase) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/locations/v1/cities/autocomplete',
        queryParameters: {
          'apikey': EnvironmentConfig.weatherApiKey,
          'q': phrase.replaceAll(' ', '')
        },
      );

      if (response.statusCode == 200) {
        final locationAutocompletes = (response.data as List)
            .map((json) => LocationAutocompleteRemote.fromJson(json))
            .toList();

        return right(locationAutocompletes);
      }

      return left(GeneralError.unexpected());
    } on DioException catch (exception) {
      return left(
          GeneralError(exception.message ?? GeneralError.unexpected().message));
    }
  }

  Future<Either<GeneralError, WeatherCurrentConditionsRemote>>
      fetchCurrentConditions(
    String locationKey,
  ) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/currentconditions/v1/$locationKey',
        queryParameters: {
          'apikey': EnvironmentConfig.weatherApiKey,
          'details': true,
        },
      );

      if (response.statusCode == 200) {
        final json = (response.data as List).first;

        return right(WeatherCurrentConditionsRemote.fromJson(json));
      }

      return left(GeneralError.unexpected());
    } on DioException catch (exception) {
      return left(
          GeneralError(exception.message ?? GeneralError.unexpected().message));
    }
  }

  Future<Either<GeneralError, List<WeatherForecastRemote>>>
      fetchFiveDaysForecast(
    String locationKey,
  ) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/forecasts/v1/daily/5day/$locationKey',
        queryParameters: {
          'apikey': EnvironmentConfig.weatherApiKey,
          'details': true,
          'metric': true,
        },
      );

      if (response.statusCode == 200) {
        final weatherForecastObject = response.data as Map<String, dynamic>;

        final fiveDaysForecast =
            (weatherForecastObject['DailyForecasts'] as List)
                .map((json) => WeatherForecastRemote.fromJson(json['Day']))
                .toList();

        return right(fiveDaysForecast);
      }

      return left(GeneralError.unexpected());
    } on DioException catch (exception) {
      return left(
          GeneralError(exception.message ?? GeneralError.unexpected().message));
    }
  }
}
