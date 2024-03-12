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
  final mockedWheaterData = MockedWeatherRepositoryData();
  final mockFavoritesRepo = MockFavoritesRepository();
  final mockHistoryRepo = MockHistoryRepository();

  when(mockWeatherRepo.cityAutocompleteSearch(any))
      .thenAnswer((_) async => right(mockedWheaterData.locations));
  when(mockWeatherRepo.fetchCurrentConditions(any)).thenAnswer(
      (_) async => right(mockedWheaterData.currentWeatherConditions));
  when(mockWeatherRepo.fetchFiveDaysForecast(any))
      .thenAnswer((_) async => right(mockedWheaterData.weatherForecast));
  when(mockFavoritesRepo.add(any)).thenAnswer((_) async => right(null));

  final cubit = WeatherCubit(
    weatherRepo: mockWeatherRepo,
    favoritesRepo: mockFavoritesRepo,
    historyRepo: mockHistoryRepo,
  );

  group('WeatherCubit', () {
    test(
      'Initial state is WeatherInitial()',
      () {
        expect(
          cubit.state,
          const WeatherInitial(),
        );
      },
    );
  });

  blocTest(
    'The cubit should emit WeatherCitySearchStart and WeatherCitySearchSuccess after onSearchSubmitted() is being called',
    build: () => cubit,
    act: (cubit) => cubit.onSearchSubmitted('searchPhrase'),
    expect: () => [
      const WeatherCitySearchStart('searchPhrase'),
      WeatherCitySearchSuccess(mockedWheaterData.locations),
    ],
  );

  blocTest(
    'The cubit should emit WeatherCityDataLoading and twice WeatherCityDataSuccess after onLocationSelected() is being called',
    build: () => cubit,
    act: (cubit) => cubit.onLocationSelected(mockedWheaterData.locations.first),
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
}
