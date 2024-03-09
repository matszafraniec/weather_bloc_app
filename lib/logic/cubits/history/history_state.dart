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

  const HistoryDataSuccess(this.historyItems);

  @override
  List<Object> get props => [historyItems];
}

final class HistoryDataError extends HistoryState {
  final GeneralError error;

  const HistoryDataError(this.error);
}
