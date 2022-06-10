import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/splash_screen.dart';
import 'package:frent_jogja/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: routes,
    );
  }
}
