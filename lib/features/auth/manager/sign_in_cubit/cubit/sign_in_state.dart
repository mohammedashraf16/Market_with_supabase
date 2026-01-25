part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SigInLoading extends SignInState {}

final class SigInSuccess extends SignInState {
  final UserModel userModel;

  SigInSuccess({required this.userModel});
}

final class SignInFailure extends SignInState {
  final String errorMessage;
  SignInFailure(this.errorMessage);
}

final class ForgetPasswordLoading extends SignInState {}

final class ForgetPasswordSuccess extends SignInState {}

final class ForgetPasswordFailure extends SignInState {
  final String errorMessage;

  ForgetPasswordFailure({required this.errorMessage});
}

final class ResetNewPasswordLoading extends SignInState {}

final class ResetNewPasswordSuccess extends SignInState {}

final class ResetNewPasswordFailure extends SignInState {
  final String errorMessage;

  ResetNewPasswordFailure({required this.errorMessage});
}

final class GoogleSignInLoading extends SignInState {}

final class GoogleSignInSuccess extends SignInState {}

final class GoogleSignInFailure extends SignInState {
  final String errorMessage;

  GoogleSignInFailure({required this.errorMessage});
}
