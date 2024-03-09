import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/weather_conditions_history_cache.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';

import '../../common/statics.dart';
import '../../data_sources/local/local_database_source.dart';

abstract class HistoryService {
  Future<Either<GeneralError, void>> add(WeatherCurrentConditions item);
  Stream<List<WeatherConditionsHistoryCache>> queryAllListener();
}

class HistoryServiceImpl extends HistoryService {
  final LocalDatabaseSource _db;

  HistoryServiceImpl(this._db);

  @override
  Future<Either<GeneralError, void>> add(WeatherCurrentConditions item) async {
    try {
      final domainModel = WeatherConditionsHistory.fromCurrentConditions(item);
      final dbModel = domainModel.toDbModel();

      return _db.add<WeatherConditionsHistoryCache>(dbModel.toMap());
    } catch (ex, stackTrace) {
      log(ex.toString(),
          name: Statics.loggerFavServiceName, stackTrace: stackTrace);

      return Left(GeneralError.unexpected());
    }
  }

  @override
  Stream<List<WeatherConditionsHistoryCache>> queryAllListener() => _db
      .queryAllListener<WeatherConditionsHistoryCache>()
      .map((data) => data.map(WeatherConditionsHistoryCache.fromMap).toList());
}
