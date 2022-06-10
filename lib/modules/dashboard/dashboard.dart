import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/dashboard/booking/booking.dart';
import 'package:frent_jogja/modules/dashboard/home/home.dart';
import 'package:frent_jogja/modules/dashboard/profile/profile.dart';
import 'package:frent_jogja/utils/styles.dart';

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
    ProfileScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: kRed,
        unselectedItemColor: kBlack,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt),
            label: 'Pemesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
