class Booking {
  final String name;
  final int idNumber;
  final int phoneNumber;
  final String email;
  final String address;
  final String startDate;
  final String endDate;
  final String pickUpLocation;
  final String deliveryLocation;
  final String? note;
  final String motorType;
  bool isConfirm;
  final int days;

  Booking({
    required this.name,
    required this.idNumber,
    required this.phoneNumber,
    required this.email,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.pickUpLocation,
    required this.deliveryLocation,
    this.note,
    required this.motorType,
    this.isConfirm = false,
    required this.days,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['idNumber'] = idNumber;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['address'] = address;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['pickUpLocation'] = pickUpLocation;
    data['deliveryLocation'] = deliveryLocation;
    data['note'] = note;
    data['motorType'] = motorType;
    data['isConfirm'] = isConfirm;
    data['days'] = days;

    return data;
  }
}
