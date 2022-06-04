import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/auth_controller.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isHasSuffix = false,
    required this.inputType,
    this.inputAction = TextInputAction.next,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isHasSuffix;
  final TextInputType inputType;
  final TextInputAction inputAction;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();
    return TextField(
      style: kBodyRegular,
      textInputAction: inputAction,
      keyboardType: inputType,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        suffixIcon: isHasSuffix
            ? IconButton(
                onPressed: () {
                  loginController.showPassword();
                },
                icon: Icon(
                  loginController.isObscure.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(200.0),
        ),
        hintText: hintText,
        hintStyle: kBodyRegularHint,
      ),
    );
  }
}
