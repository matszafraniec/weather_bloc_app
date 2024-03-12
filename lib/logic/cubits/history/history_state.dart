part of 'history_cubit.dart';

sealed class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial();
}

final class HistoryDataLoading extends HistoryState {}

final class HistoryDataSuccess extends HistoryState {
  final List<WeatherConditionsHistory> historyItems;
  final WeatherConditionsHistory? itemPreview;

  const HistoryDataSuccess({
    required this.historyItems,
    this.itemPreview,
  });

  @override
  List<Object> get props => [
        historyItems,
        itemPreview ?? Object(),
      ];
}

final class HistoryDataError extends HistoryState {
  final GeneralError error;

  const HistoryDataError(this.error);
}
