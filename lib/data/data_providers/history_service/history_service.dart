import 'package:dartz/dartz.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/cache/weather_current_conditions_cache.dart';

import '../../data_sources/local/local_database_source.dart';

abstract class HistoryService {
  Future<Either<GeneralError, void>> add(WeatherCurrentConditionsCache item);
  Future<Either<GeneralError, List<WeatherCurrentConditionsCache>>> fetchAll();
}

class HistoryServiceImpl extends HistoryService {
  final LocalDatabaseSource _db;

  HistoryServiceImpl(this._db);

  @override
  Future<Either<GeneralError, void>> add(
      WeatherCurrentConditionsCache item) async {
    return _db.add<WeatherCurrentConditionsCache>(item.toMap());
  }

  @override
  Future<Either<GeneralError, List<WeatherCurrentConditionsCache>>>
      fetchAll() async {
    try {
      final response = await _db.fetchAll<WeatherCurrentConditionsCache>();

      return response.fold(
        (error) => left(GeneralError.unexpected()),
        (data) => right(
          data.map((e) => WeatherCurrentConditionsCache.fromMap(e)).toList(),
        ),
      );
    } catch (ex) {
      return left(GeneralError.unexpected());
    }
  }
}
