import 'package:get/get.dart';

class UserModel extends GetxService {
   int? id;
   String? fullName;
   String? phone;
   String? birthDate;
   String? image;
   String? gender;
   String? city;
   String? token;
   String? message;
   String? wPhone;

  UserModel({this.message,
    this.id,
    this.fullName,
    this.phone,
    this.wPhone,
    this.birthDate,
    this.image,
    this.gender,
    this.city,
    this.token});

  factory UserModel.fromJson(Map<String, dynamic> jsonObject) {
    return UserModel(
      id: jsonObject["result"]["id"],
      fullName: jsonObject["result"]["full_name"],
      phone: jsonObject["result"]["phone"],
      wPhone: jsonObject["result"]["w_phone"],
      birthDate: jsonObject["result"]["birthdate"],
      image: jsonObject["result"]["image"],
      gender: jsonObject["result"]["gender"],
      city: jsonObject["result"]["city"],
      token: jsonObject["result"]["token"],
      message: jsonObject["message"],
    );
  }
}

