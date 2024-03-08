import 'package:get_it/get_it.dart';
import 'package:weather_bloc_app/data/data_providers/favorites_service/favorites_service.dart';
import 'package:weather_bloc_app/data/data_sources/local/local_database_source.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

import 'data/repositories/weather_repository.dart';
import 'logic/cubits/weather/weather_cubit.dart';

final locator = GetIt.instance;

Future setupServiceLocator() async {
  locator.registerSingleton(AppNavigator());

  locator.registerFactory(
    () => WeatherCubit(locator()),
  );
  locator
      .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  await _initializeLocalDbReferencesAndServices();
}

Future<void> _initializeLocalDbReferencesAndServices() async {
  final localDatabase =
      locator.registerSingleton<LocalDatabaseSource>(LocalDatabaseSourceImpl());
  await localDatabase.setup();

  locator.registerLazySingleton<FavoritesService>(
    () => FavoritesServiceImpl(
      db: localDatabase.db,
      collection: localDatabase.favoritesCollection,
    ),
  );
}
