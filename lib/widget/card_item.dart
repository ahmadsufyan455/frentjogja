import 'package:flutter/material.dart';

import '../utils/styles.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.image,
    required this.type,
    required this.price,
    required this.status,
  }) : super(key: key);

  final String image;
  final String type;
  final int price;
  final bool status;

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
          FadeInImage.assetNetwork(
            placeholder: 'assets/images/loading.gif',
            image: image,
          ),
          Text('Sewa $type', style: kBodyBold),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.price_change, color: kBlack),
                  const SizedBox(width: 10.0),
                  Text('Rp.$price/hari', style: kBodyRegular),
                ],
              ),
              Text(
                status ? 'Tersedia' : 'Tidak Tersedia',
                style: status
                    ? kBodyRegular.copyWith(color: Colors.green)
                    : kBodyRegular.copyWith(color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
