import 'package:flutter/material.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:frent_jogja/utils/styles.dart';
import 'package:get/get.dart';

import 'auth/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> moveToNext() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Get.offNamed(LoginScreen.routeName);
  }

  @override
  void initState() {
    super.initState();
    moveToNext();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kRed, kWhite],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Image.asset('$image/frent-logo.png', width: 150.0),
        ),
      ),
    );
  }
}
