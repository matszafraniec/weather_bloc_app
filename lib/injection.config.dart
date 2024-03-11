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
import 'data/data_providers/weather_service/local/weather_local_cache.dart'
    as _i6;
import 'data/data_providers/weather_service/remote/weather_remote_service.dart'
    as _i7;
import 'data/data_providers/weather_service/weather_service.dart' as _i10;
import 'data/data_sources/local/local_database_source.dart' as _i4;
import 'data/repositories/favorites_repository.dart' as _i11;
import 'data/repositories/history_repository.dart' as _i12;
import 'data/repositories/mocks/mocked_weather_repository.dart' as _i9;
import 'data/repositories/weather_repository.dart' as _i8;
import 'logic/cubits/favorite/favorite_cubit.dart' as _i14;
import 'logic/cubits/history/history_cubit.dart' as _i15;
import 'logic/cubits/weather/weather_cubit.dart' as _i13;

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
    gh.lazySingleton<_i6.WeatherLocalCache>(
      () => _i6.WeatherLocalCache(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.WeatherRemoteService>(
      () => _i7.WeatherRemoteService(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i8.WeatherRepository>(
      () => _i9.MockedWeatherRepository(),
      registerFor: {_mock},
    );
    gh.lazySingleton<_i10.WeatherService>(
      () => _i10.WeatherServiceImpl(
        remoteService: gh<_i7.WeatherRemoteService>(),
        localCache: gh<_i6.WeatherLocalCache>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.FavoritesRepository>(
      () => _i11.FavoritesRepositoryImpl(gh<_i3.FavoritesService>()),
      registerFor: {
        _prod,
        _mock,
      },
    );
    gh.lazySingleton<_i12.HistoryRepository>(
      () => _i12.HistoryRepositoryImpl(gh<_i5.HistoryService>()),
      registerFor: {
        _mock,
        _prod,
      },
    );
    gh.factory<_i13.WeatherCubit>(() => _i13.WeatherCubit(
          weatherRepo: gh<_i8.WeatherRepository>(),
          favoritesRepo: gh<_i11.FavoritesRepository>(),
          historyRepo: gh<_i12.HistoryRepository>(),
        ));
    gh.lazySingleton<_i8.WeatherRepository>(
      () => _i8.WeatherRepositoryImpl(gh<_i10.WeatherService>()),
      registerFor: {_prod},
    );
    gh.factory<_i14.FavoriteCubit>(() =>
        _i14.FavoriteCubit(favoritesRepo: gh<_i11.FavoritesRepository>()));
    gh.factory<_i15.HistoryCubit>(
        () => _i15.HistoryCubit(historyRepo: gh<_i12.HistoryRepository>()));
    return this;
  }
}
