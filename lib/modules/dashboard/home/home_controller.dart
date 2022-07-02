import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/motor.dart';
import '../../../utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController searchController;
  RxList<Motor> motors = <Motor>[].obs;
  RxList<Motor> foundMotors = <Motor>[].obs;
  RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    motors.bindStream(listMotor());
    username.bindStream(getUserName());
    foundMotors.value = motors;
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void filterMotor(String type) {
    List<Motor> results = [];
    if (type.isEmpty) {
      results = motors;
    } else {
      results = motors
          .where((value) =>
              value.type.toString().toLowerCase().contains(type.toLowerCase()))
          .toList();
    }
    foundMotors.value = results;
  }

  Stream<String> getUserName() {
    var userId = auth.currentUser?.uid;
    Stream<DocumentSnapshot<Map<String, dynamic>>> stream =
        firebaseFirestore.collection('UserData').doc(userId).snapshots();
    return stream.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return data['name'];
    });
  }

  Stream<List<Motor>> listMotor() {
    Stream<QuerySnapshot<Object?>>? stream =
        firebaseFirestore.collection('MotorData').snapshots();

    return stream.map((qShot) => qShot.docs.map(
          (doc) {
            Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
            return Motor(
              motorId: data['motorId'],
              image: data['image'],
              type: data['type'],
              description: data['description'],
              price: data['price'],
              quantity: data['quantity'],
              status: data['status'],
            );
          },
        ).toList());
  }
}
