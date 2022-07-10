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

  int getTotalBooking() =>
      bookingData.where((value) => value.isConfirm == false).toList().length;

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
              bookingId: data['bookingId'],
              name: data['name'],
              idNumber: data['idNumber'],
              phoneNumber: data['phoneNumber'],
              email: data['email'],
              address: data['address'],
              startDate: data['startDate'],
              endDate: data['endDate'],
              startTime: data['startTime'],
              pickUpLocation: data['pickUpLocation'],
              deliveryLocation: data['deliveryLocation'],
              motorType: data['motorType'],
              days: data['days'],
              note: data['note'],
              totalPrice: data['totalPrice'],
              isConfirm: data['isConfirm'],
              motorImage: data['motorImage'],
              isFinish: data['isFinish'],
            );
          },
        ).toList());
  }

  void updateStatus(String bookingId) {
    firebaseFirestore
        .collection('BookingData')
        .doc(bookingId)
        .get()
        .then((value) {
      firebaseFirestore
          .collection('UserData')
          .doc(auth.currentUser!.uid)
          .collection('BookingData')
          .doc(bookingId)
          .update({
        'isConfirm': value['isConfirm'],
        'isFinish': value['isFinish'],
      });
    });
  }
}
