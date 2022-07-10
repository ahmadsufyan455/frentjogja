import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/modules/other/booking_success.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/user.dart';

class FormController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController noteController;
  late TextEditingController startDateController;
  late TextEditingController endDateController;
  late TextEditingController startTimeController;
  late TextEditingController otherPickUpController;
  late TextEditingController otherDeliveryController;

  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Rx<UserModel> user = UserModel(
    name: '',
    idNumber: 0,
    phoneNumber: 0,
    email: '',
  ).obs;

  RxString pickUpLocation = ''.obs;
  RxString deliveryLocation = ''.obs;

  int bookingId = DateTime.now().millisecondsSinceEpoch;

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
      if (selectedStartDate.value.isAfter(DateTime.now())) {
        startDateController.text =
            DateFormat.yMd().format(selectedStartDate.value);
      } else {
        Get.snackbar(
          'Terjadi Kesalahan',
          'Tanggal sewa tidak boleh lewat dari tanggal saat ini',
        );
      }
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

  Future selectStartTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
        context: context,
        initialTime: selectedTime.value,
        initialEntryMode: TimePickerEntryMode.dial);
    if (timeOfDay != null) {
      selectedTime.value = timeOfDay;
      final localizations = MaterialLocalizations.of(Get.context!);
      final formattedTimeOfDay = localizations.formatTimeOfDay(
        timeOfDay,
        alwaysUse24HourFormat:
            MediaQuery.of(Get.context!).alwaysUse24HourFormat,
      );
      startTimeController.text = formattedTimeOfDay;
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
    startTimeController = TextEditingController();
    otherPickUpController = TextEditingController();
    otherDeliveryController = TextEditingController();
    user.bindStream(userData());
  }

  void submitFormUser(
    String bookingId,
    String name,
    int idNumber,
    int phoneNumber,
    String email,
    String address,
    String startDate,
    String endDate,
    String startTime,
    String pickUpLocation,
    String deliveryLocation,
    String? note,
    String motorType,
    int days,
    int totalPrice,
    String motorImage,
    bool isFinish,
  ) {
    final bookingData = Booking(
      bookingId: bookingId,
      name: name,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      email: email,
      address: address,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      pickUpLocation: pickUpLocation,
      deliveryLocation: deliveryLocation,
      note: note,
      motorType: motorType,
      days: days,
      totalPrice: totalPrice,
      motorImage: motorImage,
      isFinish: isFinish,
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
      Get.snackbar(
        'Terjadi Kesalahan',
        e.toString(),
      );
    }
  }

  void submitFormAdmin(
    String bookingId,
    String name,
    int idNumber,
    int phoneNumber,
    String email,
    String address,
    String startDate,
    String endDate,
    String startTime,
    String pickUpLocation,
    String deliveryLocation,
    String? note,
    String motorType,
    int days,
    int totalPrice,
    String motorImage,
    bool isFinish,
  ) {
    final bookingData = Booking(
      bookingId: bookingId,
      name: name,
      idNumber: idNumber,
      phoneNumber: phoneNumber,
      email: email,
      address: address,
      startDate: startDate,
      endDate: endDate,
      startTime: startTime,
      pickUpLocation: pickUpLocation,
      deliveryLocation: deliveryLocation,
      note: note,
      motorType: motorType,
      days: days,
      totalPrice: totalPrice,
      motorImage: motorImage,
      isFinish: isFinish,
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
    startTimeController.dispose();
    otherPickUpController.dispose();
    otherDeliveryController.dispose();
  }
}
