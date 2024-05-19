import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/favourites/data/favourite/favourite.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  static FavouriteCubit get(context) => BlocProvider.of(context);
  FavouriteModel? favoritemodel;
  Set<String> favoriteID = {};

  Future<void> getFavouriteData() async {
    favoritemodel?.data?.data?.clear();
    emit(FavLoadState());
    DioHelper()
        .getData(
      url: FAVOURITES,
      token: userToken,
    )
        .then((value) {
      favoritemodel = FavouriteModel.fromJson(value.data);
      favoritemodel?.data?.data?.forEach((item) {
        favoriteID.add(item.id.toString());
      });
      print('Favourite Number is ${favoritemodel?.data?.data?.length}');
      emit(FavSuccesState(fav: favoritemodel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(FavErrorState());
    });
  }

  void addOrRemoveFromFavorites({required String productID})async {
 await  DioHelper().postData(
    url: FAVOURITES,
    token: userToken,
    data: {
      'product_id': productID,
    },
  ).then((value) async {
    if (favoriteID.contains(productID)) {
      favoriteID.remove(productID);
    } else {
      favoriteID.add(productID);
    }
    await getFavouriteData();
    emit(AddOrRemoveFromFavoritesSuccessState());
  }).catchError((onError) {
    print(onError.toString());
    emit(AddOrRemoveFromFavoritesErrorState());
  });
}

}
