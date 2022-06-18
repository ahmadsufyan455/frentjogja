import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/styles.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: kBlack),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('$image/vario.png'),
          Text('Sewa Honda Vario 125', style: kBodyBold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.price_change, color: kBlack),
                  const SizedBox(width: 10.0),
                  Text('Rp.80.000/hari', style: kBodyRegular),
                ],
              ),
              Text(
                'Tesedia',
                style: kBodyRegular.copyWith(color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
