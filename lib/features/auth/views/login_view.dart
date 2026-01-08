import 'package:flutter/material.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/widgets/custom_btn.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';
import 'package:markety/core/widgets/password_field.dart';
import 'package:markety/features/auth/views/widgets/custom_have_an_account_or_not_widget.dart';
import 'package:markety/features/auth/views/widgets/custom_login_with_google_or_facebook_widget.dart';
import 'package:markety/features/auth/views/widgets/custom_or_login_with_text_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Login",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        lable: "Email",
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 16),
                      PasswordField(),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                Routes.resetPassowrdRoute,
                              ),
                              child: Text(
                                textAlign: TextAlign.start,
                                "Forget Password?",
                                style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: CustomBtn(
                          lable: "Login",
                          onPressed: () => Navigator.pushNamed(
                            context,
                            Routes.mainLayoutRoute,
                          ),
                        ),
                      ),
                      CustomOrLoginWithTextWidget(lable: "Or Login With"),
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
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.signUpRoute),
                        title: "Don’t have account? ",
                        subTitle: "Create now",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
