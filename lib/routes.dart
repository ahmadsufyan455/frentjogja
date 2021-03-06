import 'package:frent_jogja/modules/dashboard/booking/detail_booking.dart';
import 'package:frent_jogja/modules/dashboard/profile/edit_profile.dart';
import 'package:frent_jogja/modules/form/detail_form.dart';
import 'package:frent_jogja/modules/other/about.dart';
import 'package:frent_jogja/modules/other/payment.dart';

import '../modules/other/booking_success.dart';

import '../modules/form/booking_form.dart';
import 'modules/other/empty_form.dart';

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
  GetPage(
    name: BookingForm.routeName,
    page: () => const BookingForm(),
  ),
  GetPage(
    name: EmptyForm.routeName,
    page: () => const EmptyForm(),
  ),
  GetPage(
    name: BookingSucess.routeName,
    page: () => const BookingSucess(),
  ),
  GetPage(
    name: Payment.routeName,
    page: () => const Payment(),
  ),
  GetPage(
    name: DetailForm.routeName,
    page: () => const DetailForm(),
  ),
  GetPage(
    name: DetailBooking.routeName,
    page: () => const DetailBooking(),
  ),
  GetPage(
    name: EditProfile.routeName,
    page: () => const EditProfile(),
  ),
  GetPage(
    name: AboutPage.routeName,
    page: () => const AboutPage(),
  ),
];
