part of 'favourite_cubit.dart';

sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavLoadState extends FavouriteState {}

final class FavSuccesState extends FavouriteState {
  final FavouriteModel fav;

  FavSuccesState({required this.fav});
}

final class FavErrorState extends FavouriteState {}

final class AddOrRemoveFromFavoritesSuccessState extends FavouriteState {}

final class AddOrRemoveFromFavoritesErrorState extends FavouriteState {}
