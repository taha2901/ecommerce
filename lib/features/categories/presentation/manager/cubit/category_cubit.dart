import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/categories/data/category/category.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  
  static CategoryCubit get(context) => BlocProvider.of(context);

  Category? category;

  void getCategoryData() {
    DioHelper().getData(url: GET_CATEGORIES).then((value) {
      category = Category.fromJson(value.data);
      emit(ShopSuccessCategoryState());
    }).catchError((onError) {
      print(onError.toString());
      emit(ShopErrorCategoryState());
    });
  }
}
