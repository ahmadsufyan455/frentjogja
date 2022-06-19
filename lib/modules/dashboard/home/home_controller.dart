import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/motor.dart';
import '../../../utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController searchController;
  RxList<Motor> motors = <Motor>[].obs;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
    motors.bindStream(listMotor());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>>? getUserName() {
    var userId = auth.currentUser?.uid;
    if (userId != null) {
      return firebaseFirestore.collection('UserData').doc(userId).get();
    }
    return null;
  }

  Stream<List<Motor>> listMotor() {
    Stream<QuerySnapshot<Object?>>? stream =
        firebaseFirestore.collection('MotorData').snapshots();

    return stream.map((qShot) => qShot.docs.map(
          (doc) {
            Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
            return Motor(
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
