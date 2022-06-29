import 'package:flutter/material.dart';
import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/modules/other/payment.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:get/get.dart';

import '../../../utils/styles.dart';

class DetailBooking extends StatelessWidget {
  const DetailBooking({Key? key}) : super(key: key);

  static const routeName = '/detail_booking';

  @override
  Widget build(BuildContext context) {
    final Booking data = Get.arguments;
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
                'Berikut adalah detail pesanan kamu',
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
                      Text(data.name, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('NIK :', style: kBodyRegular),
                      Text(data.idNumber.toString(), style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('No whatsapp :', style: kBodyRegular),
                      Text(data.phoneNumber.toString(), style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Email :', style: kBodyRegular),
                      Text(data.email, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Alamat di Jogja:', style: kBodyRegular),
                      Text(data.address, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tgl mulai sewa :', style: kBodyRegular),
                      Text(data.startDate, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tgl selesai sewa :', style: kBodyRegular),
                      Text(data.endDate, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lokasi penjemputan :', style: kBodyRegular),
                      Text(data.pickUpLocation, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lokasi pengantaran :', style: kBodyRegular),
                      Text(data.deliveryLocation, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Keperluan sewa :', style: kBodyRegular),
                      data.note == null
                          ? Text('-', style: kBodyBold)
                          : Text(data.note!, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Type motor :', style: kBodyRegular),
                      Text(data.motorType, style: kBodyBold),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lama sewa :', style: kBodyRegular),
                      Text(
                        '${data.days} hari',
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
                text: 'Pembayaran',
                onPressed: () => Get.toNamed(
                  Payment.routeName,
                  arguments: data,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
