import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                'Berikut adalah hal-hal yang sering ditanyakan seputar sewa motor Frent Jogja.',
                style: kBodyRegular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
