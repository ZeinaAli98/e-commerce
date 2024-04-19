class MyProductModel {
  final int? id;
  final String? arName;
  final String? enName;
  final String? arDescription;
  final String? enDescription;
  final int? price;
  final int? rentPrice;
  final int? views;
  final String? video;
  final String? type;
  final int? discount;
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
  final CategoryModel? category;

  MyProductModel({
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
    this.category,
  });

  List<MyProductModel> fromJsonArray(Map<String,dynamic> jsonArray) {
    return jsonArray["result"]
        .map<MyProductModel>(
          (e) => MyProductModel.fromJson(e),
        )
        .toList();
  }

  factory MyProductModel.fromJson(Map<String, dynamic> json) {
    return MyProductModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      price: json['price'],
      rentPrice: json['rent_price'],
      views: json['views'],
      video: json['video'],
      type: json['type'],
      discount: json['discount'],
      categoryId: json['category_id'],
      statusId: json['status_id'],
      labelId: json['label_id'],
      customerId: json['customer_id'],
      topSales: json['top_sales'],
      approved: json['approved'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      searchName: json['search_name'],
      name: json['name'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
    );
  }
}

class CategoryModel {
  final int id;
  final String? arName;
  final String? enName;
  final String? image;
  final bool? active;
  final String? createdAt;
  final String? updatedAt;
  final String? name;

  CategoryModel({
    required this.id,
    this.arName,
    this.enName,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      image: json['image'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
    );
  }
}
