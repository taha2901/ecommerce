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

  void getFavouriteData() {
    emit(FavLoadState());
    DioHelper()
        .getData(
      url: FAVOURITES,
      token: userToken,
    )
        .then((value) {
      favoritemodel = FavouriteModel.fromJson(value.data);
      print('Favourite Number is ${favoritemodel?.data?.data?.length}');
      emit(FavSuccesState(fav: favoritemodel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(FavErrorState());
    });
  }
}
