import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/models/user.dart';
import 'package:get/get.dart';

import '../../../utils/constants.dart';

class ProfileController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;

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
    user.bindStream(userData());
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

  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    idNumberController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
  }
}
