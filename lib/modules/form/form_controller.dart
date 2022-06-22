import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormController extends GetxController {
  late TextEditingController nameController;
  late TextEditingController idNumberController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController noteController;
  late TextEditingController startDate;
  late TextEditingController endDate;
  late TextEditingController otherPickUp;
  late TextEditingController otherDelivery;

  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  RxString pickUpLocation = ''.obs;
  RxString deliveryLocation = ''.obs;

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
      startDate.text = DateFormat.yMd().format(selectedStartDate.value);
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
        endDate.text = DateFormat.yMd().format(selectedEndDate.value);
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
    startDate = TextEditingController();
    endDate = TextEditingController();
    otherPickUp = TextEditingController();
    otherDelivery = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    idNumberController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    noteController.dispose();
    startDate.dispose();
    endDate.dispose();
    otherPickUp.dispose();
    otherDelivery.dispose();
  }
}
