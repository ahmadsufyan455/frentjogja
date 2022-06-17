import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/auth/auth_controller.dart';
import 'package:frent_jogja/modules/splash_screen.dart';
import 'package:frent_jogja/routes.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:frent_jogja/utils/styles.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseInitialization.then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kRedBar),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      getPages: routes,
    );
  }
}
