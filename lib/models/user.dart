class UserModel {
  String name;
  int idNumber;
  int phoneNumber;
  String email;

  UserModel({
    required this.name,
    required this.idNumber,
    required this.phoneNumber,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['idNumber'] = idNumber;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    return data;
  }
}
