import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/widgets/custom_btn.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';
import 'package:markety/core/widgets/password_field.dart';
import 'package:markety/features/auth/cubit/auth_cubit.dart';
import 'package:markety/features/auth/views/widgets/custom_have_an_account_or_not_widget.dart';
import 'package:markety/features/auth/views/widgets/custom_login_with_google_or_facebook_widget.dart';
import 'package:markety/features/auth/views/widgets/custom_or_login_with_text_widget.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
            if (state is AuthSuccess) {
              Navigator.pushNamed(context, Routes.signInRoute);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Registration Successful"),
                  backgroundColor: Colors.green,
                ),
              );
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24),
                    Card(
                      margin: EdgeInsets.all(30),
                      elevation: 2,
                      color: AppColors.kWhiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            CustomTextFormField(
                              lable: "Username",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 16),
                            CustomTextFormField(
                              controller: emailController,
                              lable: "Email",
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 16),
                            PasswordField(controller: passwordController),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20.0,
                              ),
                              child: state is AuthLoading
                                  ? CircularProgressIndicator()
                                  : CustomBtn(
                                      lable: "Register",
                                      onPressed: () {
                                        context
                                            .read<AuthCubit>()
                                            .signUpWithEmailAndPassword(
                                              emailController.text,
                                              passwordController.text,
                                            );
                                      },
                                    ),
                            ),
                            CustomOrLoginWithTextWidget(
                              lable: "Or Register with",
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomLoginWithGoogleOrFacebookWidget(
                                    image: "assets/images/google.png",
                                    lable: "Google",
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: CustomLoginWithGoogleOrFacebookWidget(
                                    image: "assets/images/Facebook.png",
                                    lable: "Facebook",
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 60),
                            CustomHaveAccountOrNotWidget(
                              onTap: () {},
                              title: "Already have an account? ",
                              subTitle: "Login now",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
