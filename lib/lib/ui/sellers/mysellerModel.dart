





class MySellerModel {
  int? id;
  String? fullName;
  String? phone;
  String? wPhone;
  dynamic code;
  dynamic verifiedAt;
  String? image;
  String? gender;
  dynamic city;
  dynamic birthdate;
  bool? featured;
  bool? active;
  String? createdAt;
  String? updatedAt;

  MySellerModel({
    this.id,
    this.fullName,
    this.phone,
    this.wPhone,
    this.code,
    this.verifiedAt,
    this.image,
    this.gender,
    this.city,
    this.birthdate,
    this.featured,
    this.active,
    this.createdAt,
    this.updatedAt});
  List<MySellerModel> fromJsonArray(Map<String,dynamic> jsonArray) {
    return jsonArray["result"]
        .map<MySellerModel>(
          (e) => MySellerModel.fromJson(e),
    )
        .toList();
  }

  MySellerModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    fullName = json["full_name"];
    phone = json["phone"];
    wPhone = json["w_phone"];
    code = json["code"];
    verifiedAt = json["verified_at"];
    image = json["image"];
    gender = json["gender"];
    city = json["city"];
    birthdate = json["birthdate"];
    featured = json["featured"];
    active = json["active"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }


}