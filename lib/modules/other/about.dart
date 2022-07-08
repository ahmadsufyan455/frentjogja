import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
