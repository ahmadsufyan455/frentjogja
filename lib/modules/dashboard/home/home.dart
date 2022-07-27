import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/detail/detail_screen.dart';
import 'package:frent_jogja/modules/other/about.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/motor.dart';
import '../../../widget/card_item.dart';
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
                      Obx(
                        () => Text(
                          "Hai, ${controller.username}\nSelamat datang",
                          style: kHeadingRegular.copyWith(
                            color: kWhite,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(AboutPage.routeName),
                        child: Image.asset(
                          'assets/images/frent-logo.png',
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    onChanged: (value) => controller.filterMotor(value),
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
            Expanded(
              child: Obx(
                () => controller.foundMotors.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.all(34.0),
                        child: Center(
                          child: Lottie.asset('assets/lottie/404.json'),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.foundMotors.length,
                        itemBuilder: (context, index) {
                          final RxList<Motor> data = controller.foundMotors;
                          return InkWell(
                            onTap: () => Get.toNamed(
                              DetailScreen.routeName,
                              arguments: data[index],
                            ),
                            child: CardItem(
                              image: data[index].image,
                              type: data[index].type,
                              price: data[index].price,
                              status: data[index].status,
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green.shade700,
        onPressed: () async =>
            // ignore: deprecated_member_use
            await launch(
          'https://wa.me/6287838938806?text=Halo, saya ingin menyewa motor',
        ),
        child: const Icon(
          Icons.phone,
          color: kWhite,
        ),
      ),
    );
  }
}
