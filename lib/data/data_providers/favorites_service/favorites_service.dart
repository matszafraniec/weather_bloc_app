import 'package:dartz/dartz.dart';
import 'package:sembast/sembast.dart';
import 'package:weather_bloc_app/data/models/general_error/domain/general_error.dart';

import '../../models/weather_current_conditions/domain/location_info.dart';

abstract class FavoritesService {
  Future<Either<GeneralError, void>> add(LocationInfoCache location);
  Future<Either<GeneralError, void>> delete(String key);
  Future<Either<GeneralError, List<LocationInfoCache>>> fetchAll();
}

class FavoritesServiceImpl extends FavoritesService {
  final Database _db;
  final StoreRef<int, Map<String, Object?>> _collection;

  FavoritesServiceImpl({
    required Database db,
    required StoreRef<int, Map<String, Object?>> collection,
  })  : _db = db,
        _collection = collection;

  @override
  Future<Either<GeneralError, void>> add(LocationInfoCache location) async {
    try {
      await _collection.add(_db, location.toMap());

      return right(null);
    } catch (ex) {
      return left(GeneralError.unexpected());
    }
  }

  @override
  Future<Either<GeneralError, void>> delete(String key) async {
    try {
      await _collection.delete(
        _db,
        finder: Finder(
          filter: Filter.equals('key', key),
        ),
      );

      return right(null);
    } catch (ex) {
      return left(GeneralError.unexpected());
    }
  }

  @override
  Future<Either<GeneralError, List<LocationInfoCache>>> fetchAll() async {
    try {
      final records = await _collection.find(_db);
      final List<LocationInfoCache> locations = [];

      for (final record in records) {
        final item = LocationInfoCache.fromMap(record.value);

        locations.add(item);
      }

      return right(locations);
    } catch (ex) {
      return left(GeneralError.unexpected());
    }
  }
}

// @override
  // Future<void> setup() async {
  //   final dir = await getApplicationDocumentsDirectory();

  //   final dbPath = '${dir.path}/weather.db';
  //   final dbFactory = databaseFactoryIo;

  //   _db = await dbFactory.openDatabase(dbPath);

  //   _favoritesCollection = intMapStoreFactory.store('favorites');

  //   final item = WeatherCurrentConditions(
  //     icon: 3,
  //     regularTemperature: 24,
  //     realFeelTemperature: 28,
  //     windSpeed: 15.5,
  //     uvIndexTest: 'Good',
  //   )..locationInfo = LocationInfo(
  //       key: '12345',
  //       city: 'Bydgoszcz',
  //       area: 'Kujawsko-Pomorskie',
  //       country: 'Poland',
  //     );

  //   // await _favoritesCollection.add(_db, item.toMap());

  //   // final records = await _favoritesCollection.find(_db);

  //   // for (final record in records) {
  //   //   final item = WeatherCurrentConditions.fromMap(record.value);

  //   //   print(item);
  //   // }
  // }