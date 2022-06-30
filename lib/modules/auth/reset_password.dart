import 'package:flutter/material.dart';
import '../../modules/auth/auth_controller.dart';
import '../../widget/auth_input.dart';
import '../../widget/button.dart';
import 'package:get/get.dart';

import '../../utils/styles.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  static const routeName = '/reset_password';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Ganti Password',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Masukkan email kamu untuk mengganti password',
                style: kBodyRegular,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              AuthInput(
                controller: controller.emailResetPassword,
                hintText: 'Email',
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              CustomButton(
                icon: Icons.email,
                text: 'Ganti Password',
                onPressed: () {
                  controller.resetPassword(
                    controller.emailResetPassword.text.trim(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
