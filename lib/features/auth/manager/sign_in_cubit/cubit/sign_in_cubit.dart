import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:markety/features/auth/models/user_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  SupabaseClient client = Supabase.instance.client;
  final googleSignIn = GoogleSignIn.instance;

  Future<void> signInWithEmailAndPassword(String password, String email) async {
    try {
      emit(SigInLoading());
      var response = await client.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user != null) {
        return emit(
          SigInSuccess(
            userModel: UserModel(
              id: response.user!.id,
              name: response.user?.email ?? "",
              email: response.user!.email ?? "",
            ),
          ),
        );
      } else {
        emit(SignInFailure("Failed to sign up user."));
      }
    } on Exception catch (e) {
      log("error in sign up cubit $e");
      emit(SignInFailure(e.toString()));
    }
  }

  Future<void> requestResetPassword(String email) async {
    try {
      emit(ForgetPasswordLoading());
      await Supabase.instance.client.auth.resetPasswordForEmail(email);
      emit(ForgetPasswordSuccess());
    } catch (e) {
      log("Error to rquest New password : $e");
      emit(ForgetPasswordFailure(errorMessage: e.toString()));
    }
  }

  Future<void> resetNewPassword(String newPassword) async {
    try {
      emit(ResetNewPasswordLoading());
      var response = await Supabase.instance.client.auth.updateUser(
        UserAttributes(password: newPassword),
      );
      if (response.user != null) {
        emit(ResetNewPasswordSuccess());
      } else {
        emit(
          ResetNewPasswordFailure(
            errorMessage: "Failed to update password please try again.",
          ),
        );
      }
    } catch (e) {
      log("Error to reset New password : $e");
      emit(ResetNewPasswordFailure(errorMessage: e.toString()));
    }
  }

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      const webClientId =
          '803662511473-0ekcp4cvu7gqbk0i1nqcn413i8aprc4a.apps.googleusercontent.com';
      final scopes = ['email', 'profile'];
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize(serverClientId: webClientId);
      final googleUser = await googleSignIn.attemptLightweightAuthentication();
      if (googleUser == null) {
        throw AuthException('Failed to sign in with Google.');
      }
      final authorization =
          await googleUser.authorizationClient.authorizationForScopes(scopes) ??
          await googleUser.authorizationClient.authorizeScopes(scopes);
      final idToken = googleUser.authentication.idToken;
      if (idToken == null) {
        throw AuthException('No ID Token found.');
      }
      var response = await client.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
      log("Response: $response");
      emit(GoogleSignInSuccess());
    } on Exception catch (e) {
      emit(GoogleSignInFailure(errorMessage: e.toString()));
      log("Error when to Sign in with google: $e");
    }
  }
}
