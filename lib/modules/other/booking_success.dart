import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/dashboard/dashboard.dart';
import 'package:frent_jogja/modules/other/payment.dart';
import 'package:frent_jogja/utils/styles.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class BookingSucess extends StatelessWidget {
  const BookingSucess({Key? key}) : super(key: key);

  static const routeName = '/booking_success';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(34.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/success.json'),
            Text(
              'Yay!, pesanan kamu sudah masuk. Silahkan melakukan pembayaran agar segera di proses admin',
              textAlign: TextAlign.center,
              style: kBodyRegular,
            ),
            const SizedBox(height: 34.0),
            CustomButton(
                text: 'Pembayaran',
                onPressed: () {
                  Get.toNamed(Payment.routeName);
                }),
            const SizedBox(height: 16.0),
            CustomButton(
              text: 'Beranda',
              onPressed: () => Get.offAllNamed(Dashboard.routeName),
            ),
          ],
        ),
      ),
    ));
  }
}
