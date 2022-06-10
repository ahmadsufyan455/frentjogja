import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/auth_controller.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:frent_jogja/utils/styles.dart';
import 'package:frent_jogja/widget/auth_input.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  static const routeName = '/sign_up';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        title: Text(
          'Buat Akun',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Image.asset('$image/frent-logo.png', width: 100.0),
                const SizedBox(height: 34.0),
                Text(
                  'Silahkan lengkapi formulir berikut ya!',
                  style: kBodyRegular,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.nameSignUp,
                  hintText: 'Nama',
                  inputType: TextInputType.name,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.nikSignUp,
                  hintText: 'NIK',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.waSignUp,
                  hintText: 'No whatsapp',
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.emailSignUp,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.passwordSignUp,
                  hintText: 'Kata sandi',
                  inputType: TextInputType.visiblePassword,
                  isHasSuffix: true,
                  isObscure: true,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.confirmPasswordSignUp,
                  hintText: 'Konfirmasi kata sandi',
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                  isHasSuffix: true,
                  isObscure: true,
                ),
                const SizedBox(height: 34.0),
                CustomButton(
                  text: 'Daftar',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
