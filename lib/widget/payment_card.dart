import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/constants.dart';

import '../utils/styles.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.paymentName,
    this.imageName,
    required this.paymentStep,
  }) : super(key: key);

  final String paymentName;
  final String? imageName;
  final List<Widget> paymentStep;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            if (imageName != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset('$image/$imageName', width: 50.0),
              ),
            Text(paymentName, style: kBodyBold)
          ],
        ),
        children: paymentStep,
      ),
    );
  }
}
