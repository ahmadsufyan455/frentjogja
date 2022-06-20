import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/dashboard/dashboard.dart';
import '../../widget/button.dart';
import '../../utils/styles.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class EmptyForm extends StatelessWidget {
  const EmptyForm({Key? key}) : super(key: key);

  static const routeName = '/empty_form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/not_available.json'),
              const SizedBox(height: 16.0),
              Text(
                'Opps. . .  Saat ini motor tidak tersedia,\nsedang disewa orang lain',
                style: kBodyRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 34.0),
              CustomButton(
                text: 'Pilih motor lain',
                onPressed: () => Get.offNamedUntil(
                  Dashboard.routeName,
                  (route) => false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
