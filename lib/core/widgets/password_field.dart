import 'package:flutter/material.dart';
import 'package:markety/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController? controller;
  const PasswordField({super.key, this.controller});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      lable: "Password",
      obscureText: obscureText,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: Icon(obscureText ? Icons.remove_red_eye : Icons.visibility_off),
      ),
    );
  }
}
