class ProductsDetails {
  bool? success;
  Product? result;
  String? message;

  ProductsDetails({
    this.success,
    this.result,
    this.message,
  });

  factory ProductsDetails.fromJson(Map<String, dynamic> json) {
    return ProductsDetails(
      success: json['success'],
      result: json['result'] != null ? Product.fromJson(json['result']) : null,
      message: json['message'],
    );
  }
}

class Product {
  int? id;
  String? arName;
  String? enName;
  String? arDescription;
  String? enDescription;
  int? price;
  int? rentPrice;
  int? views;
  String? video;
  String? type;
  int? discount;
  int? categoryId;
  int? statusId;
  int? labelId;
  int? customerId;
  bool? topSales;
  bool? approved;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? searchName;
  String? name;
  Category? category;
  Customer? customer;
  List<Parameter>? parameters;

  Product({
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
    this.customer,
    this.parameters,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
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
          ? Category.fromJson(json['category'])
          : null,
      customer: json['customer'] != null
          ? Customer.fromJson(json['customer'])
          : null,
      parameters: json['parameters'] != null ? (json['parameters'] as List)
          .map((item) => Parameter.fromJson(item))
          .toList() : null,
    );
  }
}

class Category {
  int? id;
  String? arName;
  String? enName;
  String? image;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? name;

  Category({
    this.id,
    this.arName,
    this.enName,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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

class Customer {
  int? id;
  String? fullName;
  String? phone;
  String? wPhone;
  String? code;
  String? verifiedAt;
  String? image;
  String? gender;
  String? city;
  String? birthdate;
  bool? featured;
  bool? active;
  String? createdAt;
  String? updatedAt;

  Customer({
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
    this.updatedAt,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'],
      fullName: json['full_name'],
      phone: json['phone'],
      wPhone: json['w_phone'],
      code: json['code'],
      verifiedAt: json['verified_at'],
      image: json['image'],
      gender: json['gender'],
      city: json['city'],
      birthdate: json['birthdate'],
      featured: json['featured'],
      active: json['active'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
class Parameter {
  int? id;
  String? arName;
  String? enName;
  String? arValue;
  String? enValue;
  int? productId;
  String? createdAt;
  String? updatedAt;

  Parameter({
    this.id,
    this.arName,
    this.enName,
    this.arValue,
    this.enValue,
    this.productId,
    this.createdAt,
    this.updatedAt,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      arValue: json['ar_value'],
      enValue: json['en_value'],
      productId: json['product_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}