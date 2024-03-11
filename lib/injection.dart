import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/data_sources/local/local_database_source.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

import 'injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> setupDependencies(Environment environment) async {
  locator.registerSingleton(AppNavigator());
  locator
      .registerSingleton<LocalDatabaseSource>(LocalDatabaseSourceImpl())
      .setup();

  locator.init(environment: environment.name);
}

// void setupServiceLocator() {
//   locator.registerSingleton(AppNavigator());

//   _initializeCubitDependencies();
//   _initializeDataProviders();
//   _initializeLocalDbReferencesAndServices();
// }

// void _initializeCubitDependencies() {
//   locator.registerFactory(
//     () => WeatherCubit(
//       weatherRepo: locator(),
//       favoritesRepo: locator(),
//       historyRepo: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => FavoriteCubit(
//       favoritesRepo: locator(),
//     ),
//   );
//   locator.registerFactory(
//     () => HistoryCubit(
//       historyRepo: locator(),
//     ),
//   );
// }

// void _initializeDataProviders() {
//   locator
//       .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());
//   locator.registerLazySingleton<FavoritesRepository>(
//       () => FavoritesRepositoryImpl(locator()));
//   locator.registerLazySingleton<HistoryRepository>(
//       () => HistoryRepositoryImpl(locator()));
// }

// void _initializeLocalDbReferencesAndServices() {
//   locator
//       .registerSingleton<LocalDatabaseSource>(LocalDatabaseSourceImpl())
//       .setup();

//   locator.registerLazySingleton<FavoritesService>(
//     () => FavoritesServiceImpl(locator()),
//   );

//   locator.registerLazySingleton<HistoryService>(
//     () => HistoryServiceImpl(locator()),
//   );
// }
