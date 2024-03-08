import 'package:get_it/get_it.dart';
import 'package:weather_bloc_app/data/data_providers/favorites_service/favorites_service.dart';
import 'package:weather_bloc_app/data/data_providers/history_service/history_service.dart';
import 'package:weather_bloc_app/data/data_sources/local/local_database_source.dart';
import 'package:weather_bloc_app/data/repositories/favorites_repository.dart';
import 'package:weather_bloc_app/logic/cubits/favorite/favorite_cubit.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

import 'data/repositories/weather_repository.dart';
import 'logic/cubits/weather/weather_cubit.dart';

final locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton(AppNavigator());

  locator.registerFactory(
    () => WeatherCubit(
      weatherRepo: locator(),
      favoritesRepo: locator(),
    ),
  );
  locator.registerFactory(
    () => FavoriteCubit(
      favoritesRepo: locator(),
    ),
  );

  locator
      .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());
  locator.registerLazySingleton<FavoritesRepository>(
      () => FavoritesRepositoryImpl(locator()));

  _initializeLocalDbReferencesAndServices();
}

void _initializeLocalDbReferencesAndServices() {
  locator
      .registerSingleton<LocalDatabaseSource>(LocalDatabaseSourceImpl())
      .setup();

  locator.registerLazySingleton<FavoritesService>(
    () => FavoritesServiceImpl(locator()),
  );

  locator.registerLazySingleton<HistoryService>(
    () => HistoryServiceImpl(locator()),
  );
}
