import 'package:flutter/material.dart';
import 'package:markety/core/widgets/custom_btn.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              CustomTextFormField(
                lable: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20),
              CustomBtn(lable: "Reset Password", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
