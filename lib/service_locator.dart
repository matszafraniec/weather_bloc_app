import 'package:get_it/get_it.dart';
import 'package:weather_bloc_app/data/data_providers/favorites_service/favorites_service.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

import 'data/repositories/weather_repository.dart';
import 'logic/cubits/weather/weather_cubit.dart';

final locator = GetIt.instance;

setupServiceLocator() {
  locator.registerSingleton(AppNavigator());

  locator.registerFactory(
    () => WeatherCubit(locator()),
  );

  locator
      .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());

  locator.registerSingleton<FavoritesService>(
    FavoritesServiceImpl()..setup(),
  );
}
