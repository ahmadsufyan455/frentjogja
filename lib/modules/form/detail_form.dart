import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/form/form_controller.dart';
import 'package:frent_jogja/modules/other/booking_success.dart';
import 'package:frent_jogja/utils/helper.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class DetailForm extends StatelessWidget {
  const DetailForm({Key? key}) : super(key: key);

  static const routeName = '/detail_form';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormController());
    final data = Get.arguments;
    final totalPrice = data[0]['booking'].totalPrice;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Detail Pesanan',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Text(
                'Berikut adalah detail pesanan kamu, pastikan tidak ada data yang salah ya!',
                style: kBodyRegular,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: kBlack),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Nama :', style: kBodyRegular),
                      Text(data[0]['booking'].name, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NIK :', style: kBodyRegular),
                      Text(data[0]['booking'].idNumber.toString(),
                          style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No whatsapp :', style: kBodyRegular),
                      Text(data[0]['booking'].phoneNumber.toString(),
                          style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email :', style: kBodyRegular),
                      Text(data[0]['booking'].email, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Alamat di Jogja:', style: kBodyRegular),
                      Text(data[0]['booking'].address, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tgl mulai sewa :', style: kBodyRegular),
                      Text(data[0]['booking'].startDate, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tgl selesai sewa :', style: kBodyRegular),
                      Text(data[0]['booking'].endDate, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lokasi penjemputan :', style: kBodyRegular),
                      Text(data[0]['booking'].pickUpLocation, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lokasi pengantaran :', style: kBodyRegular),
                      Text(data[0]['booking'].deliveryLocation,
                          style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Keperluan sewa :', style: kBodyRegular),
                      data[0]['booking'].note != ''
                          ? Text(data[0]['booking'].note, style: kBodyBold)
                          : Text('-', style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type motor :', style: kBodyRegular),
                      Text(data[0]['booking'].motorType, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lama sewa :', style: kBodyRegular),
                      Text(
                        '${data[0]['booking'].days} hari',
                        style: kBodyBold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total bayar :', style: kBodyRegular),
                      Text(
                        Helper.convertToIdr(data[0]['booking'].totalPrice, 2),
                        style: kBodyBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Kirim Formulir',
                onPressed: () {
                  Get.dialog(
                    const Center(child: CircularProgressIndicator(color: kRed)),
                    barrierDismissible: false,
                  );
                  Future.delayed(const Duration(seconds: 1), () {
                    controller.updateQuantity(data[1]['motor'].motorId);
                    controller.submitFormUser(
                      data[0]['booking'].bookingId,
                      data[0]['booking'].name,
                      data[0]['booking'].idNumber,
                      data[0]['booking'].phoneNumber,
                      data[0]['booking'].email,
                      data[0]['booking'].address,
                      data[0]['booking'].startDate,
                      data[0]['booking'].endDate,
                      data[0]['booking'].startTime,
                      data[0]['booking'].pickUpLocation,
                      data[0]['booking'].deliveryLocation,
                      data[0]['booking'].note,
                      data[0]['booking'].motorType,
                      data[0]['booking'].days,
                      data[0]['booking'].totalPrice,
                      data[0]['booking'].motorImage,
                      data[0]['booking'].isFinish,
                    );
                    controller.submitFormAdmin(
                      data[0]['booking'].bookingId,
                      data[0]['booking'].name,
                      data[0]['booking'].idNumber,
                      data[0]['booking'].phoneNumber,
                      data[0]['booking'].email,
                      data[0]['booking'].address,
                      data[0]['booking'].startDate,
                      data[0]['booking'].endDate,
                      data[0]['booking'].startTime,
                      data[0]['booking'].pickUpLocation,
                      data[0]['booking'].deliveryLocation,
                      data[0]['booking'].note,
                      data[0]['booking'].motorType,
                      data[0]['booking'].days,
                      data[0]['booking'].totalPrice,
                      data[0]['booking'].motorImage,
                      data[0]['booking'].isFinish,
                    );
                    Get.toNamed(
                      BookingSucess.routeName,
                      arguments: totalPrice,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
