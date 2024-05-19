part of 'home_cubit.dart';

sealed class HomeState  {

}

final class HomeInitial extends HomeState {}



final class BannersLoadingState extends HomeState {}

final class BannersSuccessState extends HomeState {
  final Banners banners;

  BannersSuccessState({required this.banners});
}

final class BannersErrorState extends HomeState {
  final String error;

  BannersErrorState(this.error);
}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final Home home;

  HomeSuccessState({required this.home});
}

final class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}

class HomeFilteredState extends HomeState {
  // final List<Home> filteredProducts;
  // HomeFilteredState({required this.filteredProducts});
}