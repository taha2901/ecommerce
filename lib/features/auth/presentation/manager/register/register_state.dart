part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoaded extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final Auth registerModel;

  RegisterSuccess({required this.registerModel});
}


final class RegisterFailure extends RegisterState {
  final String errMessage;

  RegisterFailure(this.errMessage);
}

final class RegisterchangePasswordVisibility extends RegisterState {}
