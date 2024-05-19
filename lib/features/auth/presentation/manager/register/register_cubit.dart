import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/auth/data/auth_model/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    Auth registerModel;
    emit(RegisterLoaded());
    DioHelper().postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    ).then((value) {
      print(value.data);
      registerModel = Auth.fromJson(value.data);
      emit(RegisterSuccess(registerModel: registerModel));
    }).catchError((onError) {
      print(onError.toString());
      emit(RegisterFailure(onError.toString()));
    });
  }

  bool isObsecure = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isObsecure = !isObsecure;
    suffix =
        isObsecure ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterchangePasswordVisibility());
  }
}
