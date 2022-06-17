import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late TextEditingController searchController;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
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
}
