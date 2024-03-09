import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:weather_bloc_app/data/data_providers/history_service/history_service.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_current_conditions.dart';

import '../models/general_error/domain/general_error.dart';

abstract class HistoryRepository {
  Future<Either<GeneralError, void>> add(WeatherCurrentConditions item);
  Stream<List<WeatherConditionsHistory>> queryAllListener();
}

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryService _service;

  HistoryRepositoryImpl(this._service);

  @override
  Future<Either<GeneralError, void>> add(WeatherCurrentConditions item) async {
    return _service.add(item);
  }

  @override
  Stream<List<WeatherConditionsHistory>> queryAllListener() =>
      _service.queryAllListener().map(
            (data) => data.map(WeatherConditionsHistory.fromDbModel).toList()
              ..sort(
                (a, b) => b.lastSeenAt.compareTo(a.lastSeenAt),
              ),
          );
}
