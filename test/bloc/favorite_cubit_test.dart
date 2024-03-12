import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_bloc_app/data/repositories/favorites_repository.dart';
import 'package:weather_bloc_app/data/repositories/mocks/data.dart';
import 'package:weather_bloc_app/logic/cubits/favorite/favorite_cubit.dart';

@GenerateNiceMocks([
  MockSpec<FavoritesRepository>(),
])
import 'favorite_cubit_test.mocks.dart';

void main() {
  final mockFavoritesRepo = MockFavoritesRepository();
  final mockedData = MockedWeatherRepositoryData();

  when(mockFavoritesRepo.queryAllListener()).thenAnswer(
    (_) => Stream.value(
      mockedData.locations.map((e) => e.toLocationInfo()).toList(),
    ),
  );

  group(
    'FavoriteCubit',
    () {
      blocTest(
        'The cubit should emit FavoriteDataSuccess on startup',
        build: () => FavoriteCubit(favoritesRepo: mockFavoritesRepo),
        expect: () => [
          isA<FavoriteDataSuccess>(),
        ],
      );
    },
  );
}
