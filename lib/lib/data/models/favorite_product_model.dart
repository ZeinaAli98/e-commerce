class FavoriteProductModel {
  bool? success;
  List<Product>? result;
  String? message;

  FavoriteProductModel({
     this.success,
     this.result,
     this.message,
  });

  factory FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductModel(
      success: json['success'] as bool,
      result: (json['result'] as List<dynamic>)
          .map<Product>(
            (e) => Product.fromJson(e as Map<String, dynamic>),
      )
          .toList(),
      message: json['message'] as String,
    );
  }
}

class Product {
  int id;

  String arName;
  String enName;
  String arDescription;
  String enDescription;
  int price;
  int rentPrice;
  int views;
  dynamic video;
  String type;
  int discount;
  int categoryId;
  int statusId;
  int labelId;
  int customerId;
  bool topSales;
  bool approved;
  bool active;
  String createdAt;
  String updatedAt;
  String searchName;
  String name;
  Category category;

  Product({
    required this.id,
    required this.arName,
    required this.enName,
    required this.arDescription,
    required this.enDescription,
    required this.price,
    required this.rentPrice,
    required this.views,
    required this.video,
    required this.type,
    required this.discount,
    required this.categoryId,
    required this.statusId,
    required this.labelId,
    required this.customerId,
    required this.topSales,
    required this.approved,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.searchName,
    required this.name,
    required this.category,
  });


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      arName: json['ar_name'] as String,
      enName: json['en_name'] as String,
      arDescription: json['ar_description'] as String,
      enDescription: json['en_description'] as String,
      price: json['price'] as int,
      rentPrice: json['rent_price'] as int,
      views: json['views'] as int,
      video: json['video'],
      type: json['type'] as String,
      discount: json['discount'] as int,
      categoryId: json['category_id'] as int,
      statusId: json['status_id'] as int,
      labelId: json['label_id'] as int,
      customerId: json['customer_id'] as int,
      topSales: json['top_sales'] as bool,
      approved: json['approved'] as bool,
      active: json['active'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      searchName: json['search_name'] as String,
      name: json['name'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
    );
  }
}

class Category {
  int id;
  String arName;
  String enName;
  String image;
  bool active;
  String createdAt;
  String updatedAt;
  String name;

  Category({
    required this.id,
    required this.arName,
    required this.enName,
    required this.image,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      arName: json['ar_name'] as String,
      enName: json['en_name'] as String,
      image: json['image'] as String,
      active: json['active'] as bool,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      name: json['name'] as String,
    );
  }
}
