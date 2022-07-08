import 'package:flutter/material.dart';
import 'package:frent_jogja/widget/faq_card.dart';

import '../../utils/styles.dart';

class Faq extends StatelessWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'FAQ',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Berikut adalah hal-hal yang sering ditanyakan seputar sewa motor Frent Jogja.',
                style: kBodyRegular,
              ),
              const SizedBox(height: 24.0),
              FaqCard(
                question: 'Syarat-syarat untuk sewa motornya apa saja ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Syaratnya pelanggan harus memiliki Sim C dan menjaminkan 3 kartu identitas yang masih berlaku seperti KTP, KTM, NPWP, KARPEG, NPWP, BPJS, ASKES, KK, SIM A, KTA, dsb.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Berapa harga sewa motornya ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Untuk harga sewa bisa langsung dilihat pada halaman utama aplikasi yang menampilkan list motor beserta detailnya, sewaktu-waktu harga sewa bisa berubah.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Apa saja fasilitas sewa yang di dapatkan ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '1 sepeda motor, 2 buah helm, 1 Jas Hujan (Untuk jumlah jas hujannya dapat dikonfirmasikan kembali pada saat pemesanan sewa motor), masker.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Apakah bisa sewa setengah hari saja ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sewa motor pada FRent Jogja minimal selama 24 jam, apabila menginginkan untuk sewa kurang dari 24 Jam, maka tarif sewa yang kami kenakan tetaplah tarif untuk 24 jam.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Apakah kondisi motornya terjamin ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Kami selalu menjaga kondisi motor yang kami sewakan dengan melakukan servis rutin di bengkel resmi sesuai dengan masing-masing merk motor. Apabila pada saat disewa terdapat keluhan terhadap motor kami, maka pelanggan dapat menyampaikan komplain pada admin reservasi dan kami akan melakukan yang terbaik untuk memenuhi harapan pelanggan.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question:
                    'Kalau diantar ke lokasi hotel xxxx, di jalan xxxx apakah dikenakan biaya antar-jemput ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Lokasi antar jemput yang dikenakan tarif tambahan adalah apabila lokasi tersebut berjarak lebih dari 5 KM dari kantor kami. Perhitungan jaraknya didasarkan pada perhitungan dari google maps.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Kapan jam operasional Frent Jogja ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Fasilitas antar jemput kami dimulai dari pukul 07.00 sampai dengan pukul 21.00. Apabila menginginkan untuk menyewa lebih awal atau mengembalikan lebih akhir, dapat langsung datang atau mengantar ke kantor kami di Jalan Mawar V Nomor 8, Baciro, Gondokusuman, Yogyakarta.',
                      style: kBodyRegular,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              FaqCard(
                question: 'Apakah ada biaya overtime ?',
                asnwer: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Untuk biaya overtime di FRent Jogja adalah Rp. 10.000 untuk setiap 1 jamnya. Apabila overtimenya lebih dari biaya sewa satu hari maka akan kami kenakan biaya sewa harian.',
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
