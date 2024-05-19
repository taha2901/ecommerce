part of 'category_cubit.dart';

sealed class CategoryState {

}

final class CategoryInitial extends CategoryState {}


final class ShopSuccessCategoryState extends CategoryState {}

final class ShopErrorCategoryState extends CategoryState {}
