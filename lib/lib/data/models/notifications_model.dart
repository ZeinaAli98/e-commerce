class NotificationModel {
  bool? success;
  List<NotificationResult>? result;
  String? message;

  NotificationModel({ this.success,  this.result,  this.message});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'],
      result: List<NotificationResult>.from(json['result'].map((x) => NotificationResult.fromJson(x))),
      message: json['message'],
    );
  }
}

class NotificationResult {
  int id;
  String type;
  String? image;
  String title;
  String body;
  int? productId;
  String createdAt;
  String updatedAt;
  NotificationProduct? product;

  NotificationResult({
    required this.id,
    required this.type,
    this.image,
    required this.title,
    required this.body,
    this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.product,
  });

  factory NotificationResult.fromJson(Map<String, dynamic> json) {
    return NotificationResult(
      id: json['id'],
      type: json['type'],
      image: json['image'],
      title: json['title'],
      body: json['body'],
      productId: json['product_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      product: json['product'] != null ? NotificationProduct.fromJson(json['product']) : null,
    );
  }
}

class NotificationProduct {
  int id;
  String arName;
  String enName;
  String arDescription;
  String enDescription;
  int price;
  int rentPrice;
  int views;
  dynamic video;
  String productType;
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
  NotificationCategory category;

  NotificationProduct({
    required this.id,
    required this.arName,
    required this.enName,
    required this.arDescription,
    required this.enDescription,
    required this.price,
    required this.rentPrice,
    required this.views,
    this.video,
    required this.productType,
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

  factory NotificationProduct.fromJson(Map<String, dynamic> json) {
    return NotificationProduct(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      arDescription: json['ar_description'],
      enDescription: json['en_description'],
      price: json['price'],
      rentPrice: json['rent_price'],
      views: json['views'],
      video: json['video'],
      productType: json['type'],
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
      category: NotificationCategory.fromJson(json['category']),
    );
  }
}

class NotificationCategory {
  int id;
  String arName;
  String enName;
  String image;
  bool active;
  String createdAt;
  String updatedAt;
  String name;

  NotificationCategory({
    required this.id,
    required this.arName,
    required this.enName,
    required this.image,
    required this.active,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
  });

  factory NotificationCategory.fromJson(Map<String, dynamic> json) {
    return NotificationCategory(
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