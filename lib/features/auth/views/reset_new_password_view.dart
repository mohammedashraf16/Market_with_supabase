import 'package:flutter/material.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/widgets/custom_btn.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';
import 'package:markety/core/widgets/password_field.dart';

class ResetNewPasswordView extends StatelessWidget {
  const ResetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "Reset New Password",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Enter your reset token from your email and set a new password.",
                style: TextStyle(color: AppColors.kGreyColor),
              ),
              SizedBox(height: 20),
              CustomTextFormField(lable: "Reset Token"),
              SizedBox(height: 20),
              CustomTextFormField(
                lable: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              PasswordField(),
              SizedBox(height: 20),
              CustomBtn(lable: "Reset Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
