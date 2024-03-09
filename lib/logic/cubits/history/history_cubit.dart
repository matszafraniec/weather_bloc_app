import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/weather_conditions_history.dart';
import 'package:weather_bloc_app/data/repositories/history_repository.dart';

import '../../../data/models/general_error/domain/general_error.dart';

part 'history_state.dart';

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
    emit(HistoryDataLoading());

    _querySubscription = _historyRepo.queryAllListener().listen(
          (data) => emit(HistoryDataSuccess(data)),
        );
  }

  void onItemTap() {}

  @override
  Future<void> close() async {
    await _querySubscription.cancel();
    return super.close();
  }
}
