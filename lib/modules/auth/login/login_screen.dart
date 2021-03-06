import 'package:flutter/material.dart';
import '../../../modules/auth/auth_controller.dart';
import '../../../modules/auth/register/sign_up_screen.dart';
import '../../../modules/auth/reset_password.dart';
import '../../../utils/constants.dart';
import '../../../utils/styles.dart';
import '../../../widget/auth_input.dart';
import '../../../widget/button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const routeName = '/login_screen';

  @override
  Widget build(BuildContext context) {
    bool inputCheck(String email, String password) {
      return !(email.isEmpty || password.isEmpty);
    }

    final controller = Get.put(AuthController());
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
                  controller: controller.emailLogin,
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                AuthInput(
                  controller: controller.passwordLogin,
                  hintText: 'Kata sandi',
                  isObscure: true,
                  isHasSuffix: true,
                  inputType: TextInputType.visiblePassword,
                  inputAction: TextInputAction.done,
                ),
                const SizedBox(height: 34.0),
                CustomButton(
                  text: 'Masuk',
                  onPressed: () {
                    if (inputCheck(controller.emailLogin.text.trim(),
                        controller.passwordLogin.text.trim())) {
                      controller.login(
                        controller.emailLogin.text.trim(),
                        controller.passwordLogin.text.trim(),
                      );
                    } else {
                      Get.snackbar(
                        'Kolom tidak boleh kosong',
                        'Silahkan masukkan email atau password kamu terlebih dahulu',
                      );
                    }
                  },
                ),
                const SizedBox(height: 34.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () => Get.toNamed(ResetPassword.routeName),
                    child: Text('Lupa password ?', style: kBodyRegular),
                  ),
                ),
                const SizedBox(height: 80.0),
                Text('Belum punya akun ?', style: kBodyRegular),
                InkWell(
                  onTap: () {
                    Get.toNamed(SignUpScreen.routeName);
                  },
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
