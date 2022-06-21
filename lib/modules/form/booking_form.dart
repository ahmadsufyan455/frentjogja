import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
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
                  hintText: 'Name',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number,
                  controller: controller.idNumberController,
                  hintText: 'NIK',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number,
                  controller: controller.phoneController,
                  hintText: 'No Whatsapp',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.emailAddress,
                  controller: controller.emailController,
                  hintText: 'Email',
                ),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.newline,
                  inputType: TextInputType.multiline,
                  controller: controller.addressController,
                  maxLines: 4,
                  hintText: 'Alamat sesuai KTP',
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: FormInput(
                        hintText: 'Tanggal mulai sewa',
                        isEnable: false,
                        controller: controller.startDate,
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
                        hintText: 'Tanggal selesai sewa',
                        isEnable: false,
                        controller: controller.endDate,
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
                const SizedBox(height: 16.0),
                const DropDownInputDelivery(),
                const SizedBox(height: 16.0),
                FormInput(
                  inputAction: TextInputAction.newline,
                  inputType: TextInputType.multiline,
                  controller: controller.noteController,
                  maxLines: 3,
                  hintText: 'Keperluan sewa (opsional)',
                ),
                const SizedBox(height: 24.0),
                CustomButton(
                  text: 'Kirim Formulir',
                  onPressed: () {
                    print('nama: ${controller.nameController.text}');
                    print('NIK: ${controller.idNumberController.text}');
                    print('WA: ${controller.phoneController.text}');
                    print('email: ${controller.emailController.text}');
                    print('alamat: ${controller.addressController.text}');
                    print('startDate: ${controller.startDate.text}');
                    print('endDate: ${controller.endDate.text}');
                    print('pick up: ${controller.pickUpLocation}');
                    print('delivery: ${controller.deliveryLocation}');
                    print('Keperluan: ${controller.noteController.text}');
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
