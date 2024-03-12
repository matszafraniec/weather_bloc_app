import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import 'package:weather_bloc_app/data/repositories/history_repository.dart';

import '../../../data/models/general_error/domain/general_error.dart';

part 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository _historyRepo;
  late StreamSubscription _querySubscription;

  HistoryCubit({
    required HistoryRepository historyRepo,
  })  : _historyRepo = historyRepo,
        super(const HistoryInitial()) {
    _dataListenAndPump();
  }

  void _dataListenAndPump() async {
    emit(const HistoryDataLoading());

    _querySubscription = _historyRepo.queryAllListener().listen(
          (items) => emit(HistoryDataSuccess(historyItems: items)),
        );
  }

  void onItemTap(WeatherConditionsHistory item) {
    emit(
      HistoryDataSuccess(
        historyItems: (state as HistoryDataSuccess).historyItems,
        itemPreview: item,
      ),
    );
  }

  void onPreviewDismiss() {
    emit(
      HistoryDataSuccess(
        historyItems: (state as HistoryDataSuccess).historyItems,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _querySubscription.cancel();
    return super.close();
  }
}
