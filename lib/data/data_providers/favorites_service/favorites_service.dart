import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/common/statics.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';

import '../../data_sources/local/local_database_source.dart';
import '../../models/weather_current_conditions/cache/location_info_cache.dart';
import '../../models/weather_current_conditions/domain/location_info.dart';

abstract class FavoritesService {
  Future<Either<GeneralError, void>> add(LocationInfo item);
  Future<Either<GeneralError, void>> delete(String key);
  Stream<List<LocationInfoCache>> queryAllListener();
}

@mockEnv
@prodEnv
@LazySingleton(as: FavoritesService)
class FavoritesServiceImpl extends FavoritesService {
  final LocalDatabaseSource _db;

  FavoritesServiceImpl(this._db);

  @override
  Future<Either<GeneralError, void>> add(LocationInfo item) async {
    try {
      final dbModel = item.toDbModel();

      return _db.add<LocationInfoCache>(dbModel.toMap());
    } catch (ex, stackTrace) {
      log(ex.toString(),
          name: Statics.loggerFavServiceName, stackTrace: stackTrace);

      return Left(GeneralError.unexpected());
    }
  }

  @override
  Future<Either<GeneralError, void>> delete(String key) async {
    return _db.delete<LocationInfoCache>(key);
  }

  @override
  Stream<List<LocationInfoCache>> queryAllListener() => _db
      .queryAllListener<LocationInfoCache>()
      .map((data) => data.map(LocationInfoCache.fromMap).toList());
}
