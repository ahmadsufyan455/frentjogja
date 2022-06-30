import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/models/user.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';
import '../../../utils/styles.dart';

class ProfileController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;

  late TextEditingController nameEditController;
  late TextEditingController idNumberEditController;
  late TextEditingController phoneNumberEditController;
  late TextEditingController emailEditController;

  Rx<UserModel> user = UserModel(
    name: '',
    idNumber: 0,
    phoneNumber: 0,
    email: '',
  ).obs;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    idNumberController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    nameEditController = TextEditingController();
    idNumberEditController = TextEditingController();
    phoneNumberEditController = TextEditingController();
    emailEditController = TextEditingController();
    user.bindStream(userData());
  }

  void showDialogPogressIndicator() {
    Get.dialog(
      const Center(child: CircularProgressIndicator(color: kRed)),
      barrierDismissible: false,
    );
  }

  Stream<UserModel> userData() {
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream = firebaseFirestore
        .collection('UserData')
        .doc(auth.currentUser!.uid)
        .snapshots();

    return stream.map((qShot) {
      Map<String, dynamic> data = qShot.data() as Map<String, dynamic>;
      return UserModel(
        name: data['name'],
        idNumber: data['idNumber'],
        phoneNumber: data['phoneNumber'],
        email: data['email'],
      );
    });
  }

  void updateProfile() async {
    showDialogPogressIndicator();
    try {
      await firebaseFirestore
          .collection('UserData')
          .doc(auth.currentUser!.uid)
          .update({
        'name': nameEditController.text,
        'idNumber': int.parse(idNumberEditController.text),
        'phoneNumber': int.parse(phoneNumberEditController.text),
        'email': emailEditController.text,
      });
      Get.back();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    idNumberController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    nameEditController.dispose();
    idNumberEditController.dispose();
    phoneNumberEditController.dispose();
    emailEditController.dispose();
  }
}
