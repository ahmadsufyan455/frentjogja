import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/login/login_controller.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:frent_jogja/utils/styles.dart';
import 'package:frent_jogja/widget/auth_input.dart';
import 'package:frent_jogja/widget/button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                Image.asset('$image/frent-logo.png', width: 100.0),
                const SizedBox(height: 34.0),
                Text('Hai, silahkan masuk', style: kHeadingBold),
                const SizedBox(height: 24.0),
                AuthInput(
                  controller: controller.email,
                  hintText: 'Email',
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.password,
                  hintText: 'Password',
                  obscureText: true,
                  isHasSuffix: true,
                ),
                const SizedBox(height: 34.0),
                CustomButton(
                  text: 'Masuk',
                  onPressed: () {},
                ),
                const SizedBox(height: 34.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {},
                    child: Text('Lupa password ?', style: kBodyRegular),
                  ),
                ),
                const SizedBox(height: 100.0),
                Text('Belum punya akun ?', style: kBodyRegular),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Daftar',
                    style: kBodyBold.copyWith(color: kRed),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
