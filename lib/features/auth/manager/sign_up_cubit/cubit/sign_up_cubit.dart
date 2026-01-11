import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:markety/features/auth/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  Future<void> createAccountWithEmailAndPassword(
    String password,
    String email,
  ) async {
    try {
      emit(SignUpLoading());
      var response = await Supabase.instance.client.auth.signUp(
        password: password,
        email: email,
      );
      if (response.user != null) {
        return emit(
          SignUpSuccess(
            userModel: UserModel(
              id: response.user!.id,
              name: response.user?.email ?? "",
              email: response.user!.email ?? "",
            ),
          ),
        );
      } else {
        emit(SignUpFailure("Failed to sign up user."));
      }
    } on Exception catch (e) {
      log("error in sign up cubit $e");
      emit(SignUpFailure(e.toString()));
    }
  }
}
