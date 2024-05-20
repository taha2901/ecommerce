import 'package:addinfo/core/helper/api.dart';
import 'package:addinfo/core/helper/cach.dart';
import 'package:addinfo/core/network/end_points.dart';
import 'package:addinfo/features/auth/data/auth_model/auth.dart';
import 'package:addinfo/features/profile/data/change_password/change_password.dart';
import 'package:addinfo/features/profile/data/profile_model/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileModel? profileModel;

  Future<void> getUserData() async {
    emit(ProfileLoaded());
    DioHelper().getData(url: PROFILE, token: userToken).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      print(profileModel!.status);
      print(profileModel!.message);
      print(profileModel!.data!.name);
      emit(ProfileSuccess(profileModel!));
    }).catchError((onError) {
      if (onError is DioError) {
        print(
            'Dio error: ${onError.response?.statusCode} - ${onError.message}');
        emit(ProfileFailure('Server error: ${onError.response?.statusCode}'));
      } else {
        print(onError.toString());
        emit(ProfileFailure('An unknown error occurred.'));
      }
    });
  }

  ChangePassword? changePassword;

  void changePasswordMethod({
    required String userCurrentPassword,
    required String newPassword,
  }) {
    emit(ChangePassLoaded());
    DioHelper().postData(
      url: change_password,
      token: userToken,
      data: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    ).then((value) {
      print('Change password success: ${value.data}');

      changePassword = ChangePassword.fromJson(value.data);
      ChachHelper.saveData(key: 'password', value: newPassword);
      currentPassword = ChachHelper.getData(key: 'password');
      emit(ChangePassSuccess(changePassword!));
    }).catchError((onError) {
      if (onError is DioError) {
        print(
            'Dio error: ${onError.response?.statusCode} - ${onError.message}');
        emit(ChangePassFailure(
          'Server error: ${onError.response?.statusCode} - ${onError.message}',
        ));
      } else {
        print(onError.toString());
        emit(ChangePassFailure('An unknown error occurred.'));
      }
    });
  }

  Auth? updateUser;

  void updateUserData(
      {required String name, required String email, required String phone}) {
    emit(UpdateUserLoaded());
    DioHelper().putData(url: UPDATE_PROFILE, token: userToken, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) async {
      updateUser = Auth.fromJson(value.data);
      print(' update status is ${updateUser!.status}');
      print(updateUser!.message);
      print(updateUser!.data!.name);
      await getUserData();
      emit(UpdateUserSuccess(updateUser!));
    }).catchError((onError) {
      if (onError is DioError) {
        print(
            'Dio error: ${onError.response?.statusCode} - ${onError.message}');
        emit(
            UpdateUserFailure('Server error: ${onError.response?.statusCode}'));
      } else {
        print(onError.toString());
        emit(UpdateUserFailure('An unknown error occurred.'));
      }
    });
  }
}
