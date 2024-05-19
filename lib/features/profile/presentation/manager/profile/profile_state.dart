part of 'profile_cubit.dart';

sealed class ProfileState  {

}

final class ProfileInitial extends ProfileState {}

final class ProfileLoaded extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileModel profileModel;

  ProfileSuccess(this.profileModel);
}

final class ProfileFailure extends ProfileState {
  final String errMessage;

  ProfileFailure(this.errMessage);
}


final class ChangePassLoaded extends ProfileState {}

final class ChangePassSuccess extends ProfileState {
  final ChangePassword changePassword;

  ChangePassSuccess(this.changePassword);
}

final class ChangePassFailure extends ProfileState {
  final String errMessage;

  ChangePassFailure(this.errMessage);
}