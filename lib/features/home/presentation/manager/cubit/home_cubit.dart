import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/home/data/banners/banners.dart';
import 'package:addinfo/features/home/data/home/home.dart';
import 'package:addinfo/features/home/data/home/product.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  Banners? banners;

  void getBannerData() {
    emit(BannersLoadingState());
    DioHelper().getData(url: BANNERS).then((value) {
      banners = Banners.fromJson(value.data);
      print(banners!.status);
      emit(
        BannersSuccessState(banners: banners!),
      );
    }).catchError((onError) {
      print(onError.toString());
      emit(BannersErrorState(onError.toString()));
    });
  }

  Home? home;

  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper().getData(url: HOME).then((value) {
      home = Home.fromJson(value.data);
      print(home!.status);
      emit(
        HomeSuccessState(home: home!),
      );
    }).catchError((onError) {
      print(onError.toString());
      emit(HomeErrorState(onError.toString()));
    });
  }

  List<ProductHome> filteredProducts = [];

  void filterProducts({required String input}) {
    if (home != null) {
      filteredProducts = home!.data!.products!.where((element) => element.name!.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
      emit(HomeFilteredState());
    }
  }
}
