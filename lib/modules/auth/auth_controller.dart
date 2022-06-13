import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/user.dart';
import '../../modules/auth/login/login_screen.dart';
import '../../modules/dashboard/dashboard.dart';
import 'package:get/get.dart';

import '../../utils/constants.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;
  late TextEditingController nameSignUp;
  late TextEditingController nikSignUp;
  late TextEditingController waSignUp;
  late TextEditingController emailSignUp;
  late TextEditingController passwordSignUp;
  late TextEditingController confirmPasswordSignUp;

  RxBool isObscure = true.obs;

  late Rx<User?> firebaseUser;

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

    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void showPassword() => isObscure.value = !isObscure.value;

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(LoginScreen.routeName);
    } else {
      Get.offAllNamed(Dashboard.routeName);
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (exception) {
      Get.snackbar('Opps!', 'Your email or password is invalid');
      log(exception.toString());
    }
  }

  void register(
    String name,
    int idNumber,
    int phoneNumber,
    String email,
    String password,
  ) {
    final userModel = UserModel(
      name: name,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      email: email,
    );
    try {
      auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        firebaseFirestore
            .collection('UserData')
            .doc(value.user?.uid)
            .set(userModel.toJson());
      });
    } catch (exception) {
      log(exception.toString());
    }
  }

  void logout() async {
    await auth.signOut();
  }

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
