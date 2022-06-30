import 'package:flutter/material.dart';
import 'package:frent_jogja/widget/payment_card.dart';

import '../../utils/styles.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Pembayaran',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              PaymentCard(
                paymentName: 'Gopay',
                imageName: 'gopay.png',
                paymentStep: [
                  ListTile(
                    title: Text(
                      'Segera hadir',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              PaymentCard(
                paymentName: 'OVO',
                imageName: 'ovo.png',
                paymentStep: [
                  ListTile(
                    title: Text(
                      'Segera hadir',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              PaymentCard(
                paymentName: 'Transfer Bank',
                imageName: 'mandiri.png',
                paymentStep: [
                  ListTile(
                    title: Text(
                      'Segera hadir',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
