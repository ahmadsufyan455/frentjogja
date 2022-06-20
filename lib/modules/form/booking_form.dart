import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({Key? key}) : super(key: key);

  static const routeName = '/booking_form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Formulir Pemesanan',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
    );
  }
}
