import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/data_providers/weather_service/local/weather_local_cache.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/remote/location_autocomplete_remote.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/remote/weather_current_conditions_remote.dart';
import 'package:weather_bloc_app/data/models/weather_forecast/remote/weather_forecast_remote.dart';

import '../../common/statics.dart';
import '../../models/general_error/domain/general_error.dart';
import 'remote/weather_remote_service.dart';

abstract class WeatherService {
  Future<Either<GeneralError, List<LocationAutocompleteRemote>>>
      cityAutocompleteSearch(String phrase);

  Future<Either<GeneralError, WeatherCurrentConditionsRemote>>
      fetchCurrentConditions(
    String locationKey,
  );

  Future<Either<GeneralError, List<WeatherForecastRemote>>>
      fetchFiveDaysForecast(
    String locationKey,
  );
}

@prodEnv
@LazySingleton(as: WeatherService)
class WeatherServiceImpl extends WeatherService {
  final WeatherRemoteService _remoteService;
  final WeatherLocalCache _localCache;

  WeatherServiceImpl({
    required WeatherRemoteService remoteService,
    required WeatherLocalCache localCache,
  })  : _remoteService = remoteService,
        _localCache = localCache;

  @override
  Future<Either<GeneralError, List<LocationAutocompleteRemote>>>
      cityAutocompleteSearch(String phrase) async {
    try {
      if (_localCache.cachedCitySearch.containsKey(phrase.toLowerCase())) {
        log(
          'Return city autocomplete search items from cache',
          name: Statics.loggerWeatherServiceName,
        );

        return right(_localCache.cachedCitySearch[phrase.toLowerCase()]!);
      } else {
        final response = await _remoteService.cityAutocompleteSearch(phrase);

        return response.fold(
          (error) => left(error),
          (data) {
            _localCache.updateCachedCitySearch(phrase.toLowerCase(), data);

            log(
              'Return city autocomplete search items from API',
              name: Statics.loggerWeatherServiceName,
            );

            return right(data);
          },
        );
      }
    } catch (ex, stackTrace) {
      log(
        ex.toString(),
        name: Statics.loggerWeatherServiceName,
        stackTrace: stackTrace,
      );

      return Left(GeneralError.unexpected());
    }
  }

  @override
  Future<Either<GeneralError, WeatherCurrentConditionsRemote>>
      fetchCurrentConditions(String locationKey) {
    return _remoteService.fetchCurrentConditions(locationKey);
  }

  @override
  Future<Either<GeneralError, List<WeatherForecastRemote>>>
      fetchFiveDaysForecast(String locationKey) {
    return _remoteService.fetchFiveDaysForecast(locationKey);
  }
}
