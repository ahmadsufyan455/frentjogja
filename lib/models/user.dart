class UserModel {
  String? name;
  int? idNumber;
  int? phoneNumber;
  String? email;

  UserModel({this.name, this.idNumber, this.phoneNumber, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    idNumber = json['idNumber'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['idNumber'] = idNumber;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    return data;
  }
}
