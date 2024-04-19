// ignore_for_file: non_constant_identifier_names

class SellerModel {
  int? id;
  String? fullName;
  String? phone;
  String? WPhone;
  String? code;
  String? verifiedAt;
  String? image;
  String? gender;
  String? city;
  String? birthDate;
  bool? featured;
  bool? active;
  String? createdAt;
  String? updatedAt;

  SellerModel(
      {this.id,
      this.fullName,
      this.phone,
      this.WPhone,
      this.code,
      this.verifiedAt,
      this.image,
      this.gender,
      this.city,
      this.birthDate,
      this.featured,
      this.active,
      this.createdAt,
      this.updatedAt});

  List<SellerModel> jsonArray(ArrayObject){
    return ArrayObject.map<SellerModel>((e) => SellerModel.card(e)).toList();
  }


  factory SellerModel.card(Map<String,dynamic> jsonObject) {
    return SellerModel(
      id: jsonObject["id"],
      fullName: jsonObject["full_name"],
      phone: jsonObject["phone"],
      WPhone: jsonObject["w_phone"],
      code: jsonObject["code"],
      verifiedAt: jsonObject["verified_at"],
      image: jsonObject["image"],
      gender: jsonObject["gender"],
      city: jsonObject["phone"],
      birthDate: jsonObject["birthdate"],
      featured: jsonObject["featured"],
      active: jsonObject["active"],
      createdAt: jsonObject["created_at"],
      updatedAt: jsonObject["updated_at"],
    );
  }
}
