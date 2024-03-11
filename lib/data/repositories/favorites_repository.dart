import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';

import '../data_providers/favorites_service/favorites_service.dart';
import '../models/general_error/domain/general_error.dart';

abstract class FavoritesRepository {
  Future<Either<GeneralError, void>> add(LocationInfo item);
  Future<Either<GeneralError, void>> delete(LocationInfo item);
  Stream<List<LocationInfo>> queryAllListener();
}

@prodEnv
@LazySingleton(as: FavoritesRepository)
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
  Stream<List<LocationInfo>> queryAllListener() => _service
      .queryAllListener()
      .map((data) => data.map(LocationInfo.fromDbModel).toList());
}
