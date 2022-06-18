import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frent_jogja/widget/card_item.dart';
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
              child: ListView(
                children: const [
                  CardItem(
                    image:
                        'https://www.frentjogja.com/wp-content/uploads/2021/06/sewa-motor-honda-vario125.png',
                    type: 'Honda Vario 125',
                    price: 800000,
                    status: true,
                  ),
                  CardItem(
                    image:
                        'https://www.frentjogja.com/wp-content/uploads/2021/06/sewa-motor-honda-nmax.png',
                    type: 'Yamaha N-Max',
                    price: 1100000,
                    status: false,
                  ),
                  CardItem(
                    image:
                        'https://www.frentjogja.com/wp-content/uploads/2021/06/sewa-motor-honda-genio.png',
                    type: 'Honda Genio',
                    price: 750000,
                    status: true,
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
