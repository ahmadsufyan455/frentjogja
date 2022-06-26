import 'package:flutter/material.dart';
import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/models/motor.dart';
import 'package:frent_jogja/modules/form/detail_form.dart';
import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:frent_jogja/widget/button.dart';
import '../../widget/form_input.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({Key? key}) : super(key: key);

  static const routeName = '/booking_form';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());

    bool inputCheck(
      String name,
      String idNumber,
      String phoneNumber,
      String email,
      String address,
      String startDate,
      String endDate,
      String pickUpLocation,
      String deliveryLocation,
    ) {
      return !(name.isEmpty ||
          idNumber.isEmpty ||
          phoneNumber.isEmpty ||
          email.isEmpty ||
          address.isEmpty ||
          startDate.isEmpty ||
          endDate.isEmpty ||
          pickUpLocation.isEmpty ||
          deliveryLocation.isEmpty);
    }

    final Motor motorData = Get.arguments;
    Booking bookingData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Formulir Pemesanan',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Silahkan lengkapi formulir ini ya!',
                  style: kBodyRegular,
                ),
                const SizedBox(height: 24.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.name,
                  controller: controller.nameController,
                  hintText: 'Name*',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number,
                  controller: controller.idNumberController,
                  hintText: 'NIK*',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number,
                  controller: controller.phoneController,
                  hintText: 'No Whatsapp*',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hintText: 'Email*',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.newline,
                  inputType: TextInputType.multiline,
                  controller: controller.addressController,
                  maxLines: 4,
                  hintText: 'Alamat sesuai KTP*',
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: FormInput(
                        hintText: 'Tanggal mulai sewa*',
                        isEnable: false,
                        controller: controller.startDateController,
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    IconButton(
                      onPressed: () => controller.selectStartDate(context),
                      icon: const Icon(Icons.calendar_today),
                    ),
                    const SizedBox(width: 24.0),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: FormInput(
                        hintText: 'Tanggal selesai sewa*',
                        isEnable: false,
                        controller: controller.endDateController,
                      ),
                    ),
                    const SizedBox(width: 24.0),
                    IconButton(
                      onPressed: () => controller.selectEndDate(context),
                      icon: const Icon(Icons.calendar_today),
                    ),
                    const SizedBox(width: 24.0),
                  ],
                ),
                const SizedBox(height: 16.0),
                const DropDownInputPickUp(),
                Obx(
                  () => controller.pickUpLocation.value == 'Lainnya'
                      ? Container(
                          margin: const EdgeInsets.only(top: 16.0),
                          child: FormInput(
                            inputAction: TextInputAction.newline,
                            inputType: TextInputType.multiline,
                            controller: controller.otherPickUpController,
                            maxLines: 3,
                            hintText: 'Sebutkan*',
                          ),
                        )
                      : Container(),
                ),
                const SizedBox(height: 16.0),
                const DropDownInputDelivery(),
                const SizedBox(height: 16.0),
                Obx(
                  () => controller.deliveryLocation.value == 'Lainnya'
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 16.0),
                          child: FormInput(
                            inputAction: TextInputAction.newline,
                            inputType: TextInputType.multiline,
                            controller: controller.otherDeliveryController,
                            maxLines: 3,
                            hintText: 'Sebutkan*',
                          ),
                        )
                      : Container(),
                ),
                FormInput(
                  inputAction: TextInputAction.newline,
                  inputType: TextInputType.multiline,
                  controller: controller.noteController,
                  maxLines: 3,
                  hintText: 'Keperluan sewa (opsional)',
                ),
                const SizedBox(height: 24.0),
                CustomButton(
                  text: 'Selanjutnya',
                  onPressed: () {
                    if (inputCheck(
                      controller.nameController.text,
                      controller.idNumberController.text.trim(),
                      controller.phoneController.text.trim(),
                      controller.emailController.text.trim(),
                      controller.addressController.text.trim(),
                      controller.startDateController.text.trim(),
                      controller.endDateController.text.trim(),
                      controller.pickUpLocation.value,
                      controller.deliveryLocation.value,
                    )) {
                      bookingData = Booking(
                        name: controller.nameController.text,
                        idNumber: int.parse(
                            controller.idNumberController.text.trim()),
                        phoneNumber:
                            int.parse(controller.phoneController.text.trim()),
                        email: controller.emailController.text.trim(),
                        address: controller.addressController.text.trim(),
                        startDate: controller.startDateController.text.trim(),
                        endDate: controller.endDateController.text.trim(),
                        pickUpLocation: controller.pickUpLocation.value,
                        deliveryLocation: controller.deliveryLocation.value,
                        note: controller.noteController.text,
                        motorType: motorData.type,
                      );
                      Get.toNamed(
                        DetailForm.routeName,
                        arguments: [
                          {'booking': bookingData},
                          {'motor': motorData},
                        ],
                      );
                    } else {
                      Get.snackbar(
                        'Terjadi Kesalahan',
                        'Silahkan lengkapi dulu semua formnya ya!',
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
