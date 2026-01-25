import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:markety/config/routes.dart';
import 'package:markety/core/utils/app_colors.dart';
import 'package:markety/core/widgets/custom_btn.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';
import 'package:markety/core/widgets/password_field.dart';
import 'package:markety/features/auth/manager/sign_in_cubit/cubit/sign_in_cubit.dart';

class ResetNewPasswordView extends StatelessWidget {
  ResetNewPasswordView({super.key});
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) {
            if (state is ResetNewPasswordFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            if (state is ResetNewPasswordSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Password reset successfully")),
              );
              Navigator.pushReplacementNamed(context, Routes.signInRoute);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Reset New Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Enter your reset token from your email and set a new password.",
                      style: TextStyle(color: AppColors.kGreyColor),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: emailController,
                      lable: "Email",
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    PasswordField(controller: newPasswordController),
                    SizedBox(height: 20),
                    CustomBtn(
                      lable: "Reset Password",
                      onPressed: () {
                        context.read<SignInCubit>().resetNewPassword(
                          newPasswordController.text,
                        );
                      },
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
