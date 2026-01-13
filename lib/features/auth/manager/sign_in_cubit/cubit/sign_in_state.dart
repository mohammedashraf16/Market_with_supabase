part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInInitial extends SignInState {}

final class SigInLoading extends SignInState {}

final class SigInSuccess extends SignInState {
  final UserModel userModel;

  SigInSuccess({required this.userModel});
}

final class SignUpFailure extends SignInState {
  final String errorMessage;
  SignUpFailure(this.errorMessage);
}
