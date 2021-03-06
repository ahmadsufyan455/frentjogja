import 'package:flutter/material.dart';
import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/modules/dashboard/booking/booking_controller.dart';
import 'package:frent_jogja/modules/dashboard/booking/detail_booking.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/styles.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookingController());
    RxList<Booking> data = controller.bookingData;

    Future refresh() async {
      for (int i = 0; i < data.length; i++) {
        controller.updateStatus(data[i].bookingId);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kRed,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Pesanan',
          style: kHeadingBold.copyWith(color: kWhite),
        ),
      ),
      body: Obx(
        () => controller.bookingData.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/empty.json'),
                      Text('Kamu belum memiliki pesanan', style: kBodyRegular),
                    ],
                  ),
                ),
              )
            : RefreshIndicator(
                onRefresh: refresh,
                child: ListView.builder(
                  itemCount: controller.bookingData.length,
                  itemBuilder: (context, index) {
                    //data = controller.bookingData;
                    controller.updateStatus(data[index].bookingId);
                    return InkWell(
                      onTap: () => Get.toNamed(
                        DetailBooking.routeName,
                        arguments: data[index],
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          right: 16.0,
                          top: 16.0,
                          left: 16.0,
                          bottom: 8.0,
                        ),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBlack),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          children: [
                            Image.network(data[index].motorImage, width: 100.0),
                            const SizedBox(width: 24.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[index].motorType,
                                    style: kBodyRegular),
                                data[index].isConfirm
                                    ? data[index].isFinish
                                        ? Text(
                                            'Selesai',
                                            style: kBodyRegular.copyWith(
                                              color: Colors.blue,
                                            ),
                                          )
                                        : Text(
                                            'Dikonfirmasi',
                                            style: kBodyRegular.copyWith(
                                              color: Colors.green,
                                            ),
                                          )
                                    : data[index].isFinish
                                        ? Text(
                                            'Selesai',
                                            style: kBodyRegular.copyWith(
                                              color: Colors.blue,
                                            ),
                                          )
                                        : Text(
                                            'Menunggu konfirmasi',
                                            style: kBodyRegular.copyWith(
                                                color: kRed),
                                          ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
