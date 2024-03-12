// ignore_for_file: unnecessary_cast

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_bloc_app/data/repositories/favorites_repository.dart';
import 'package:weather_bloc_app/data/repositories/history_repository.dart';
import 'package:weather_bloc_app/data/repositories/mocks/data.dart';
import 'package:weather_bloc_app/data/repositories/weather_repository.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';
import 'package:bloc_test/bloc_test.dart';

@GenerateNiceMocks([
  MockSpec<WeatherRepository>(),
  MockSpec<FavoritesRepository>(),
  MockSpec<HistoryRepository>()
])
import 'weather_cubit_test.mocks.dart';

void main() {
  final mockWeatherRepo = MockWeatherRepository();
  final mockedData = MockedWeatherRepositoryData();
  final mockFavoritesRepo = MockFavoritesRepository();
  final mockHistoryRepo = MockHistoryRepository();

  when(mockWeatherRepo.cityAutocompleteSearch(any))
      .thenAnswer((_) async => right(mockedData.locations));
  when(mockWeatherRepo.fetchCurrentConditions(any))
      .thenAnswer((_) async => right(mockedData.currentWeatherConditions));
  when(mockWeatherRepo.fetchFiveDaysForecast(any))
      .thenAnswer((_) async => right(mockedData.weatherForecast));
  when(mockFavoritesRepo.add(any)).thenAnswer((_) async => right(null));

  group(
    'WeatherCubit',
    () {
      test(
        'Initial state is WeatherInitial()',
        () {
          final cubit = WeatherCubit(
            weatherRepo: mockWeatherRepo,
            favoritesRepo: mockFavoritesRepo,
            historyRepo: mockHistoryRepo,
          );

          expect(
            cubit.state,
            const WeatherInitial(),
          );
        },
      );

      blocTest(
        'The cubit should emit WeatherCitySearchStart and WeatherCitySearchSuccess after onSearchSubmitted() is being called',
        build: () => WeatherCubit(
          weatherRepo: mockWeatherRepo,
          favoritesRepo: mockFavoritesRepo,
          historyRepo: mockHistoryRepo,
        ),
        act: (cubit) => cubit.onSearchSubmitted('searchPhrase'),
        expect: () => [
          const WeatherCitySearchStart('searchPhrase'),
          WeatherCitySearchSuccess(mockedData.locations),
        ],
      );

      blocTest(
        'The cubit should emit WeatherCityDataLoading and twice WeatherCityDataSuccess after onLocationSelected() is being called',
        build: () => WeatherCubit(
          weatherRepo: mockWeatherRepo,
          favoritesRepo: mockFavoritesRepo,
          historyRepo: mockHistoryRepo,
        ),
        act: (cubit) => cubit.onLocationSelected(mockedData.locations.first),
        expect: () => [
          const WeatherCityDataLoading(),
          isA<WeatherCityDataSuccess>()
              .having((p0) => p0.currentConditions, "is not null", isNotNull)
              .having((p0) => p0.fiveDaysForecast, "is null", isNull),
          isA<WeatherCityDataSuccess>()
              .having((p0) => p0.fiveDaysForecast, "is not null", isNotNull)
              .having((p0) => p0.fiveDaysForecast!.length, "has 5 elements", 5)
        ],
      );

      blocTest(
        'The cubit emits WeatherCityDataSuccess state with isAddedToFavorites set to true after  onAddToFavorites() is being called',
        build: () => WeatherCubit(
          weatherRepo: mockWeatherRepo,
          favoritesRepo: mockFavoritesRepo,
          historyRepo: mockHistoryRepo,
        ),
        seed: () => WeatherCityDataSuccess(
          currentConditions: mockedData.currentWeatherConditions
            ..locationInfo = mockedData.locations.first.toLocationInfo(),
          fiveDaysForecast: mockedData.weatherForecast,
          isAddedToFavorites: false,
        ) as WeatherState,
        act: (cubit) => cubit.onAddToFavorites(),
        expect: () => [
          isA<WeatherCityDataSuccess>()
              .having((p0) => p0.currentConditions, "is not null", isNotNull)
              .having((p0) => p0.fiveDaysForecast, "is not null", isNotNull)
              .having((p0) => p0.isAddedToFavorites, "is true", true),
        ],
      );
    },
  );
}
