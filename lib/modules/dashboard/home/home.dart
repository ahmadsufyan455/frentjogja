import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/modules/detail/detail_screen.dart';
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
                      FutureBuilder(
                        future: controller.getUserName(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            Map<String, dynamic> data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Text(
                              "Hai, ${data['name']}\nSelamat datang",
                              style: kHeadingRegular.copyWith(
                                color: kWhite,
                              ),
                            );
                          }
                          return Container();
                        },
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
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.motors.length,
                  itemBuilder: (context, index) {
                    final RxList<Motor> data = controller.motors;
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
    );
  }
}
