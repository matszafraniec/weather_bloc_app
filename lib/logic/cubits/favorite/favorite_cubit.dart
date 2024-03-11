import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';

import '../../../data/models/general_error/domain/general_error.dart';
import '../../../data/repositories/favorites_repository.dart';

part 'favorite_state.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepository _favoritesRepo;
  late StreamSubscription _querySubscription;

  FavoriteCubit({
    required FavoritesRepository favoritesRepo,
  })  : _favoritesRepo = favoritesRepo,
        super(const FavoriteInitial()) {
    _dataListenAndPump();
  }

  void _dataListenAndPump() async {
    emit(FavoriteDataLoading());

    _querySubscription = _favoritesRepo.queryAllListener().listen(
          (data) => emit(FavoriteDataSuccess(data)),
        );
  }

  Future<void> onItemTap(LocationInfo item) async {
    // final response = await _favoritesRepo.delete(item);

    // response.fold(
    //   (error) => emit(FavoriteDataError(error)),
    //   (_) {},
    // );
  }

  Future<void> onItemDelete(LocationInfo item) async {
    final response = await _favoritesRepo.delete(item);

    response.fold(
      (error) => emit(FavoriteDataError(error)),
      (_) {},
    );
  }

  @override
  Future<void> close() async {
    await _querySubscription.cancel();
    return super.close();
  }
}
