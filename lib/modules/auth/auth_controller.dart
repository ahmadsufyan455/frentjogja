import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/styles.dart';
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

  late TextEditingController emailResetPassword;

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
    emailResetPassword = TextEditingController();

    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  void showPassword() => isObscure.value = !isObscure.value;

  void showDialogPogressIndicator() {
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: kRed)),
      barrierDismissible: false,
    );
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAllNamed(LoginScreen.routeName);
    } else {
      Get.offAllNamed(Dashboard.routeName);
    }
  }

  void login(String email, String password) async {
    showDialogPogressIndicator();
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (exception) {
      Get.snackbar(
        'Terjadi Kesalahan!',
        'Email atau password yang kamu masukkan salah',
      );
      log(exception.toString());
      Navigator.of(Get.overlayContext!).pop();
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
    showDialogPogressIndicator();
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
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  void logout() async {
    await auth.signOut();
  }

  void resetPassword(String email) async {
    showDialogPogressIndicator();
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar('Ganti password', 'Silahkan periksa email kamu');
    } catch (exception) {
      log(exception.toString());
    }
    Get.offAllNamed(LoginScreen.routeName);
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

    emailResetPassword.dispose();
  }
}
