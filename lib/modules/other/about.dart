import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../utils/styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Tentang Kami',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image.asset('$image/frent-logo-2.png'),
              const SizedBox(height: 24.0),
              Text(
                aboutQuotes,
                style: GoogleFonts.indieFlower(
                  fontSize: 14.0,
                  color: kBlack,
                ),
              ),
              const SizedBox(height: 16.0),
              Text('Siapa Kami ?', style: kHeadingBold),
              const SizedBox(height: 16.0),
              Text(about, style: kBodyRegular),
              const SizedBox(height: 16.0),
              Text(
                address,
                style: kBodyRegular,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16.0),
              const SizedBox(
                height: 300.0,
                child: WebView(
                  javascriptMode: JavascriptMode.unrestricted,
                  initialUrl:
                      'https://www.google.com/maps/place/Sewa+Motor+Jogja+dan+Rental+Motor+Jogja+-+FRent+Jogja/@-7.7937679,110.3836353,18.04z/data=!4m5!3m4!1s0x2e7a1418a27c6e3d:0x7d902f6a07ff7b18!8m2!3d-7.793836!4d110.384618',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
