import 'package:flutter/material.dart';
import '../../../modules/dashboard/home/home_controller.dart';
import '../../../utils/styles.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: kRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Hai, Ucup\nSelamat Datang',
                        style: kHeadingRegular.copyWith(color: kWhite),
                      ),
                      Image.asset(
                        'assets/images/frent-logo.png',
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: controller.searchController,
                    style: kBodyRegular,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(200.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: kWhite,
                      hintText: 'Cari motor',
                      hintStyle: kBodyRegularHint,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
