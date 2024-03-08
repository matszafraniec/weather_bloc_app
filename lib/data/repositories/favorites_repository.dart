import 'package:dartz/dartz.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';

import '../data_providers/favorites_service/favorites_service.dart';
import '../models/general_error/domain/general_error.dart';

abstract class FavoritesRepository {
  Future<Either<GeneralError, void>> add(LocationInfo item);
  Future<Either<GeneralError, void>> delete(LocationInfo item);
  Future<Either<GeneralError, List<LocationInfo>>> fetchAll();
}

class FavoritesRepositoryImpl extends FavoritesRepository {
  final FavoritesService _service;

  FavoritesRepositoryImpl(this._service);

  @override
  Future<Either<GeneralError, void>> add(LocationInfo item) async {
    return _service.add(item);
  }

  @override
  Future<Either<GeneralError, void>> delete(LocationInfo item) async {
    return _service.delete(item.key);
  }

  @override
  Future<Either<GeneralError, List<LocationInfo>>> fetchAll() async {
    final response = await _service.fetchAll();

    return response.fold(
      (error) => left(GeneralError.unexpected()),
      (favorites) {
        return right(
          favorites.map((e) => LocationInfo.fromDbModel(e)).toList(),
        );
      },
    );
  }
}
