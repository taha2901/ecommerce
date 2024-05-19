part of 'cart_cubit.dart';

sealed class CartState  {

}

final class CartInitial extends CartState {}



final class CartsLoadState extends CartState {}

final class CartsSuccesState extends CartState {
  final CartsModel cart;

  CartsSuccesState({required this.cart});
}

final class CartsErrorState extends CartState {}

final class AddOrRemoveFromCartsSuccessState extends CartState {}

final class AddOrRemoveFromCartsErrorState extends CartState {}
