import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/login/login_controller.dart';
import 'package:get/get.dart';

import '../utils/styles.dart';

class AuthInput extends StatelessWidget {
  const AuthInput({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.isHasSuffix = false,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool isHasSuffix;

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return TextField(
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
