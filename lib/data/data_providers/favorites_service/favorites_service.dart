import 'package:dartz/dartz.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';

import '../../data_sources/local/local_database_source.dart';
import '../../models/weather_current_conditions/cache/location_info_cache.dart';

abstract class FavoritesService {
  Future<Either<GeneralError, void>> add(LocationInfoCache item);
  Future<Either<GeneralError, void>> delete(String key);
  Future<Either<GeneralError, List<LocationInfoCache>>> fetchAll();
}

class FavoritesServiceImpl extends FavoritesService {
  final LocalDatabaseSource _db;

  FavoritesServiceImpl(this._db);

  @override
  Future<Either<GeneralError, void>> add(LocationInfoCache item) async {
    return _db.add<LocationInfoCache>(item.toMap());
  }

  @override
  Future<Either<GeneralError, void>> delete(String key) async {
    return _db.delete<LocationInfoCache>(key);
  }

  @override
  Future<Either<GeneralError, List<LocationInfoCache>>> fetchAll() async {
    try {
      final response = await _db.fetchAll<LocationInfoCache>();

      return response.fold(
        (error) => left(GeneralError.unexpected()),
        (data) => right(
          data.map((e) => LocationInfoCache.fromMap(e)).toList(),
        ),
      );
    } catch (ex) {
      return left(GeneralError.unexpected());
    }
  }
}
