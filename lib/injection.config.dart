// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/data_providers/favorites_service/favorites_service.dart' as _i3;
import 'data/data_providers/history_service/history_service.dart' as _i5;
import 'data/data_sources/local/local_database_source.dart' as _i4;
import 'data/repositories/favorites_repository.dart' as _i8;
import 'data/repositories/history_repository.dart' as _i9;
import 'data/repositories/mocks/mocked_weather_repository.dart' as _i7;
import 'data/repositories/weather_repository.dart' as _i6;
import 'logic/cubits/favorite/favorite_cubit.dart' as _i11;
import 'logic/cubits/history/history_cubit.dart' as _i12;
import 'logic/cubits/weather/weather_cubit.dart' as _i10;

const String _mock = 'mock';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.FavoritesService>(
      () => _i3.FavoritesServiceImpl(gh<_i4.LocalDatabaseSource>()),
      registerFor: {
        _mock,
        _prod,
      },
    );
    gh.lazySingleton<_i5.HistoryService>(
      () => _i5.HistoryServiceImpl(gh<_i4.LocalDatabaseSource>()),
      registerFor: {
        _mock,
        _prod,
      },
    );
    gh.lazySingleton<_i6.WeatherRepository>(
      () => _i6.WeatherRepositoryImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i6.WeatherRepository>(
      () => _i7.MockedWeatherRepository(),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i8.FavoritesRepository>(
      () => _i8.FavoritesRepositoryImpl(gh<_i3.FavoritesService>()),
      registerFor: {
        _prod,
        _mock,
      },
    );
    gh.lazySingleton<_i9.HistoryRepository>(
      () => _i9.HistoryRepositoryImpl(gh<_i5.HistoryService>()),
      registerFor: {
        _mock,
        _prod,
      },
    );
    gh.factory<_i10.WeatherCubit>(() => _i10.WeatherCubit(
          weatherRepo: gh<_i6.WeatherRepository>(),
          favoritesRepo: gh<_i8.FavoritesRepository>(),
          historyRepo: gh<_i9.HistoryRepository>(),
        ));
    gh.factory<_i11.FavoriteCubit>(
        () => _i11.FavoriteCubit(favoritesRepo: gh<_i8.FavoritesRepository>()));
    gh.factory<_i12.HistoryCubit>(
        () => _i12.HistoryCubit(historyRepo: gh<_i9.HistoryRepository>()));
    return this;
  }
}
