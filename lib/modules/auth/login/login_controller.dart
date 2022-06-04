import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;

  RxBool isObscure = true.obs;

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
  }

  void showPassword() => isObscure.value = !isObscure.value;

  @override
  void onClose() {
    email.dispose();
    password.dispose();
  }
}
