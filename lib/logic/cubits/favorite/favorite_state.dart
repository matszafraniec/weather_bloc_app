part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {
  const FavoriteInitial();
}

final class FavoriteDataLoading extends FavoriteState {}

final class FavoriteDataSuccess extends FavoriteState {
  final List<LocationInfo> favorites;

  const FavoriteDataSuccess(this.favorites);

  @override
  List<Object> get props => [favorites];
}

final class FavoriteDataError extends FavoriteState {
  final GeneralError error;

  const FavoriteDataError(this.error);
}
