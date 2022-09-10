import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/helper.dart';
import 'package:get/get.dart';

import '../../models/motor.dart';
import '../../modules/form/booking_form.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../other/empty_form.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  static const routeName = '/detail_screen';

  @override
  Widget build(BuildContext context) {
    final Motor data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Detail Motor',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.network(data.image)),
                    const SizedBox(height: 16.0),
                    Center(child: Text(data.type, style: kBodyBold)),
                    Center(
                      child: Text(
                        data.status
                            ? '(🟢 Tersedia untuk di sewa)'
                            : '(🔴 Tidak tersedia untuk disewa)',
                        style: kBodyRegular,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(data.description, style: kBodyRegular),
                    const SizedBox(height: 16.0),
                    Text(
                      facilities,
                      style: kBodyRegular,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              decoration: const BoxDecoration(
                color: kBlackDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${Helper.convertToIdr(data.price, 2)}/hari',
                    style: kBodyBold.copyWith(color: kGrey),
                  ),
                  InkWell(
                    onTap: () {
                      data.status
                          ? Get.toNamed(
                              BookingForm.routeName,
                              arguments: data,
                            )
                          : Get.toNamed(EmptyForm.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: kRed,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Sewa',
                        style: kBodyRegular.copyWith(
                          color: kWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
