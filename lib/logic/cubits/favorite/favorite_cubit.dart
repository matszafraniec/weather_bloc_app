import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';

import '../../../data/models/general_error/domain/general_error.dart';
import '../../../data/repositories/favorites_repository.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepository _favoritesRepo;

  FavoriteCubit({
    required FavoritesRepository favoritesRepo,
  })  : _favoritesRepo = favoritesRepo,
        super(const FavoriteInitial()) {
    _loadData();
  }

  void _loadData() async {
    emit(FavoriteDataLoading());

    final response = await _favoritesRepo.fetchAll();

    response.fold(
      (error) => emit(FavoriteDataError(error)),
      (favorites) => emit(FavoriteDataSuccess(favorites)),
    );
  }

  Future<void> onFavoriteDelete(LocationInfo item) async {
    final response = await _favoritesRepo.delete(item);

    response.fold(
      (error) => emit(FavoriteDataError(error)),
      (_) => _loadData(),
    );
  }
}
