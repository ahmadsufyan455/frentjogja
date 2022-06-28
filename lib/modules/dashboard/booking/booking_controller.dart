import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frent_jogja/models/booking.dart';
import 'package:frent_jogja/utils/constants.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  RxList<Booking> bookingData = <Booking>[].obs;

  @override
  void onInit() {
    super.onInit();
    bookingData.bindStream(bookingList());
  }

  Stream<List<Booking>> bookingList() {
    Stream<QuerySnapshot<Map<String, dynamic>>> stream = firebaseFirestore
        .collection('UserData')
        .doc(auth.currentUser!.uid)
        .collection('BookingData')
        .snapshots();

    return stream.map((qShot) => qShot.docs.map(
          (doc) {
            Map<String, dynamic> data = doc.data();
            return Booking(
              id: data['id'],
              name: data['name'],
              idNumber: data['idNumber'],
              phoneNumber: data['phoneNumber'],
              email: data['email'],
              address: data['address'],
              startDate: data['startDate'],
              endDate: data['endDate'],
              pickUpLocation: data['pickUpLocation'],
              deliveryLocation: data['deliveryLocation'],
              motorType: data['motorType'],
              days: data['days'],
              totalPrice: data['totalPrice'],
              isConfirm: data['isConfirm'],
            );
          },
        ).toList());
  }
}
