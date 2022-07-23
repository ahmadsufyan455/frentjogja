import 'package:flutter/material.dart';
import 'package:frent_jogja/widget/payment_card.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  static const routeName = '/payment';

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    final price = data ?? 'nominal yang tertera';
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '1. Masukkan kartu ATM\n2. Pilih bahasa indonesia lalu masukkan 6 digit PIN\n3. Pilih menu transaksi lainnya\n4. Pilih menu transfer\n5. Pilih ke rekening mandiri\n 6. Masukkan nomor rekening 1610004688002 a/n Kazwaini Aminulloh\n7. Masukkan nominal transfer sebesar Rp.$price\n8. Pilih benar dan Ya pada halaman konfirmasi\n9. Kirim bukti transfer ke admin melalui WA',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              PaymentCard(
                paymentName: 'Cash',
                imageName: 'cash.png',
                paymentStep: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '1. Silahkan datang langsung ke kantor kami\n2. Lakukan pembayaran sejumlah Rp. $price\n3. Setelah melakukan pembayaran, admin akan langsung melakukan konfirmasi status pesanan',
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
