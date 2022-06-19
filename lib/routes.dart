import '../modules/auth/reset_password.dart';
import '../modules/dashboard/dashboard.dart';
import '../modules/detail/detail_screen.dart';
import 'package:get/get.dart';

import 'modules/auth/login/login_screen.dart';
import 'modules/auth/register/sign_up_screen.dart';
import 'modules/splash_screen.dart';

List<GetPage> routes = [
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
  GetPage(
    name: Dashboard.routeName,
    page: () => const Dashboard(),
  ),
  GetPage(
    name: ResetPassword.routeName,
    page: () => const ResetPassword(),
  ),
  GetPage(
    name: DetailScreen.routeName,
    page: () => const DetailScreen(),
  ),
];
