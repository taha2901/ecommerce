// import 'package:addinfo/core/helper/api.dart';
// import 'package:addinfo/core/network/end_points.dart';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'favourite_state.dart';





// class FavouriteCubit extends Cubit<FavouriteState> {
//   FavouriteCubit() : super(FavouriteInitial());
//   static FavouriteCubit get(context) => BlocProvider.of(context);
//   GetFavourite? favoritemodel;
//   Set<String> favoriteID = {};

//   Future<void> getFavouriteData() async {
//     favoritemodel?.data?.data?.clear();
//     emit(ShopLoadingGetFavouriteState());
//     DioHelper()
//         .getData(
//       url: FAVOURITES,
//       token: userToken,
//     )
//         .then((value) {
//       favoritemodel = GetFavourite.fromJson(value.data);
//       favoritemodel?.data?.data?.forEach((item) {
//         favoriteID.add(item.id.toString());
//       });
//       print('tottla isss ${favoritemodel?.data?.data?.length}');
//       emit(ShopSucessGetFavouriteState());
//     }).catchError((onError) {
//       emit(ShopErrorGetFavouriteState());
//     });
//   }

//   void addOrRemoveFromFavorites({required String productID}) {
//     DioHelper().postData(
//       url: FAVOURITES,
//       token: userToken,
//       data: {'product_id': productID},
//     ).then((value) async {
//       if (favoriteID.contains(productID)) {
//         favoriteID.remove(productID);
//       } else {
//         favoriteID.add(productID);
//       }
//       emit(AddOrRemoveFromFavoritesSuccessState());
//     }).catchError((onError) {
//       emit(AddOrRemoveFromFavoritesErrorState());
//     });
//   }
// }
