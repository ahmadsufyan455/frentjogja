import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/login/login_screen.dart';
import 'package:frent_jogja/modules/auth/register/sign_up_screen.dart';
import 'package:frent_jogja/modules/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: [
        GetPage(
          name: SplashScreen.routeName,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: LoginScreen.routeName,
          page: () => const LoginScreen(),
        ),
        GetPage(
          name: SignUpScreen.routeName,
          page: () => const SignUpScreen(),
        ),
      ],
    );
  }
}
