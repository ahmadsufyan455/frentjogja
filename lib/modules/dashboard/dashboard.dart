import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/dashboard/booking/booking_controller.dart';
import 'package:frent_jogja/modules/other/faq.dart';
import '../../modules/dashboard/booking/booking.dart';
import '../../modules/dashboard/home/home.dart';
import '../../modules/dashboard/profile/profile.dart';
import '../../utils/styles.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List<Widget> _children = const [
    HomeScreen(),
    BookingScreen(),
    Faq(),
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingC = Get.put(BookingController());
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: kRed,
          unselectedItemColor: kBlack,
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.receipt),
              label: bookingC.getTotalBooking() == 0
                  ? 'Pesanan'
                  : 'Pesanan (${bookingC.getTotalBooking()})',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.question_answer_outlined),
              label: 'FAQ',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
