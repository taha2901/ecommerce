part of 'favourite_cubit.dart';

sealed class FavouriteState  {

}

final class FavouriteInitial extends FavouriteState {}


final class ShopLoadingGetFavouriteState extends FavouriteState {}

final class ShopSucessGetFavouriteState extends FavouriteState {}

final class ShopErrorGetFavouriteState extends FavouriteState {}

final class AddOrRemoveFromFavoritesSuccessState extends FavouriteState {}

final class AddOrRemoveFromFavoritesErrorState extends FavouriteState {}
