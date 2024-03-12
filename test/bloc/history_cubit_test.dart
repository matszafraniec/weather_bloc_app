// ignore_for_file: unnecessary_cast

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import 'package:weather_bloc_app/data/repositories/history_repository.dart';
import 'package:weather_bloc_app/data/repositories/mocks/data.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';

@GenerateNiceMocks([
  MockSpec<HistoryRepository>(),
])
import 'history_cubit_test.mocks.dart';

void main() {
  final mockHistoryRepo = MockHistoryRepository();
  final mockedData = MockedWeatherRepositoryData();

  final mockedItem = WeatherConditionsHistory.fromCurrentConditions(
      mockedData.currentWeatherConditions
        ..locationInfo = mockedData.locations.first.toLocationInfo());

  when(mockHistoryRepo.queryAllListener()).thenAnswer(
    (_) => Stream.value([]),
  );

  group(
    'HistoryCubit',
    () {
      blocTest(
        'The cubit should emit HistoryDataSuccess on startup',
        build: () => HistoryCubit(historyRepo: mockHistoryRepo),
        expect: () => [
          isA<HistoryDataSuccess>(),
        ],
      );

      blocTest(
        'The cubit should emit HistoryDataSuccess with not null itemPreview property on item tap',
        build: () => HistoryCubit(historyRepo: mockHistoryRepo),
        seed: () => const HistoryDataSuccess(historyItems: []) as HistoryState,
        act: (cubit) async {
          await Future.delayed(const Duration(milliseconds: 100));
          cubit.onItemTap(mockedItem);
        },
        expect: () => [
          isA<HistoryDataSuccess>()
              .having((p0) => p0.historyItems, "isEmpty", isEmpty)
              .having((p0) => p0.itemPreview, "is null", isNull),
          isA<HistoryDataSuccess>()
              .having((p0) => p0.historyItems, "isEmpty", isEmpty)
              .having((p0) => p0.itemPreview, "is not null", isNotNull)
        ],
      );

      blocTest(
        'The cubit should emit HistoryDataSuccess ind the end with null itemPreview property on preview dismiss',
        build: () => HistoryCubit(historyRepo: mockHistoryRepo),
        seed: () => HistoryDataSuccess(
          historyItems: const [],
          itemPreview: mockedItem,
        ) as HistoryState,
        act: (cubit) => cubit.onPreviewDismiss(),
        skip: (1),
        expect: () => [
          isA<HistoryDataSuccess>()
              .having((p0) => p0.historyItems, "isEmpty", isEmpty)
              .having((p0) => p0.itemPreview, "is null", isNull),
        ],
      );
    },
  );
}
