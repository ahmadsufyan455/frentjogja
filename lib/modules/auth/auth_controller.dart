import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;
  late TextEditingController nameSignUp;
  late TextEditingController nikSignUp;
  late TextEditingController waSignUp;
  late TextEditingController emailSignUp;
  late TextEditingController passwordSignUp;
  late TextEditingController confirmPasswordSignUp;

  RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailLogin = TextEditingController();
    passwordLogin = TextEditingController();
    nameSignUp = TextEditingController();
    nikSignUp = TextEditingController();
    waSignUp = TextEditingController();
    emailSignUp = TextEditingController();
    passwordSignUp = TextEditingController();
    confirmPasswordSignUp = TextEditingController();
  }

  void showPassword() => isObscure.value = !isObscure.value;

  @override
  void onClose() {
    passwordLogin.dispose();
    passwordLogin.dispose();
    nameSignUp.dispose();
    nikSignUp.dispose();
    waSignUp.dispose();
    emailSignUp.dispose();
    passwordSignUp.dispose();
    confirmPasswordSignUp.dispose();
  }
}
