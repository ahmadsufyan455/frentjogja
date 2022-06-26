import 'dart:developer';

import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/modules/other/booking_success.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/styles.dart';

class FormController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController noteController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController otherPickUpController;
  late TextEditingController otherDeliveryController;

  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  RxString pickUpLocation = ''.obs;
  RxString deliveryLocation = ''.obs;

  int bookingId = DateTime.now().millisecondsSinceEpoch;

  Future selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedStartDate.value,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2022),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      selectedStartDate.value = picked;
      startDateController.text =
          DateFormat.yMd().format(selectedStartDate.value);
    }
  }

  Future selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedEndDate.value,
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(2022),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      selectedEndDate.value = picked;
      if (selectedEndDate.value.isAfter(selectedStartDate.value)) {
        endDateController.text = DateFormat.yMd().format(selectedEndDate.value);
      } else {
        Get.snackbar(
          'Terjadi Kesalahan',
          'Tanggal selesai sewa tidak boleh dibawah tanggal mulai sewa',
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    idNumberController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    noteController = TextEditingController();
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    otherPickUpController = TextEditingController();
    otherDeliveryController = TextEditingController();
  }

  void submitFormUser(
    String name,
    int idNumber,
    int phoneNumber,
    String email,
    String address,
    String startDate,
    String endDate,
    String pickUpLocation,
    String deliveryLocation,
    String? note,
    String motorType,
  ) {
    final bookingData = Booking(
      name: name,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      email: email,
      address: address,
      startDate: startDate,
      endDate: endDate,
      pickUpLocation: pickUpLocation,
      deliveryLocation: deliveryLocation,
      note: note,
      motorType: motorType,
    );
    try {
      firebaseFirestore
          .collection('UserData')
          .doc(auth.currentUser!.uid)
          .collection('BookingData')
          .doc(bookingId.toString())
          .set(bookingData.toJson());
      Get.toNamed(BookingSucess.routeName);
    } catch (e) {
      log(e.toString());
    }
  }

  void submitFormAdmin(
    String name,
    int idNumber,
    int phoneNumber,
    String email,
    String address,
    String startDate,
    String endDate,
    String pickUpLocation,
    String deliveryLocation,
    String? note,
    String motorType,
  ) {
    final bookingData = Booking(
      name: name,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      email: email,
      address: address,
      startDate: startDate,
      endDate: endDate,
      pickUpLocation: pickUpLocation,
      deliveryLocation: deliveryLocation,
      note: note,
      motorType: motorType,
    );

    try {
      firebaseFirestore
          .collection('BookingData')
          .doc(bookingId.toString())
          .set(bookingData.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  void updateQuantity(String id) {
    firebaseFirestore.collection('MotorData').doc(id).get().then((value) {
      firebaseFirestore.collection('MotorData').doc(id).update({
        'quantity': value['quantity'] == 0 ? 0 : value['quantity'] - 1,
        'status': value['quantity'] > 1 ? true : false,
      });
    });
  }

  @override
  void onClose() {
    nameController.dispose();
    idNumberController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    noteController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    otherPickUpController.dispose();
    otherDeliveryController.dispose();
  }
}
