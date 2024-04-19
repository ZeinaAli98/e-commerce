
class DiscountProductModel{
  final int? id;
  final String? arName;
  final String? enName;
  final String? arDescription;
  final String? enDescription;
  final double? price;
  final double? rentPrice;
  final int? views;
  final String? video;
  final String? type;
  final double? discount;
  final int? categoryId;
  final int? statusId;
  final int? labelId;
  final int? customerId;
  final bool? topSales;
  final bool? approved;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final String? searchName;
  final String? name;
  final List<DiscountProductImage>? imageList;

  DiscountProductModel({
    this.id,
    this.arName,
    this.enName,
    this.arDescription,
    this.enDescription,
    this.price,
    this.rentPrice,
    this.views,
    this.video,
    this.type,
    this.discount,
    this.categoryId,
    this.statusId,
    this.labelId,
    this.customerId,
    this.topSales,
    this.approved,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.searchName,
    this.name,
    this.imageList,
  });
  List<DiscountProductModel> fromJsonArray(jsonArray) {
    return jsonArray
        .map<DiscountProductModel>((jsonObject) => DiscountProductModel.fromJson(jsonObject))
        .toList();
  }
  factory DiscountProductModel.fromJson(jsonObject) {
    // ignore: prefer_null_aware_operators
    List<DiscountProductImage> imageArray = [];
    if (jsonObject['image'] != null) {
      imageArray = (jsonObject['image'])
          .map<DiscountProductImage>((imageJson) => DiscountProductImage.fromJson(imageJson))
          .toList();
    }
    return DiscountProductModel(
      id: jsonObject['id'],
      arName: jsonObject['ar_name'],
      enName: jsonObject['en_name'],
      arDescription: jsonObject['ar_description'],
      enDescription: jsonObject['en_description'],
      price: jsonObject['price'].toDouble(),
      rentPrice: jsonObject['rent_price'].toDouble(),
      views: jsonObject['views'],
      video: jsonObject['video'],
      type: jsonObject['type'],
      discount: jsonObject['discount'].toDouble(),
      categoryId: jsonObject['category_id'],
      statusId: jsonObject['status_id'],
      labelId: jsonObject['label_id'],
      customerId: jsonObject['customer_id'],
      topSales: jsonObject['top_sales'],
      approved: jsonObject['approved'],
      active: jsonObject['active'],
      createdAt: jsonObject['created_at'],
      updatedAt: jsonObject['updated_at'],
      searchName: jsonObject['search_name'],
      name: jsonObject['name'],
      imageList: imageArray,
    );
  }
}

class DiscountProductImage {
  int? id;
  String? image;
  int? productId;
  String? createdAt;
  String? updatedAt;
  String? uuid;

  DiscountProductImage({
    this.id,
    this.image,
    this.productId,
    this.createdAt,
    this.updatedAt,
    this.uuid,
  });

  factory DiscountProductImage.fromJson(jsonObject) {
    return DiscountProductImage(
      id: jsonObject['id'],
      image: jsonObject['image'],
      productId: jsonObject['product_id'],
      createdAt: jsonObject['created_at'],
      updatedAt: jsonObject['updated_at'],
      uuid: jsonObject['uuid'],
    );
  }
}
