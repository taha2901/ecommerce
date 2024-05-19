import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/carts/data/carts_model/carts_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);
  CartsModel? cartModel;
  Set<String> cartsId = {};
  Future<void> getCarts() async {
    emit(CartsLoadState());
    DioHelper().getData(url: CARTS, token: userToken).then((value) {
      cartModel = CartsModel.fromJson(value.data);
      cartModel?.data?.cartItems?.forEach((item) {
        cartsId.add(item.id.toString());
      });
      print('Carts Number is ${cartModel!.data!.cartItems!.length}');
      emit(CartsSuccesState(cart: cartModel!));
    }).catchError((onError) {
      print(onError.toString());
      emit(CartsErrorState());
    });
  }

  void addOrRemoveFromCarts({required String id}) async {
    await DioHelper().postData(
      url: CARTS,
      token: userToken,
      data: {
        'product_id': id,
      },
    ).then((value) async {
      if (cartsId.contains(id)) {
        cartsId.remove(id);
      } else {
        cartsId.add(id);
      }
      await getCarts();
      emit(AddOrRemoveFromCartsSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      emit(AddOrRemoveFromCartsSuccessState());
    });
  }
}
