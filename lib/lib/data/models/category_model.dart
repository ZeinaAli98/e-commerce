class CategoryModel {
  final int? id;
  final String? arName;
  final String? enName;
  final String? image;
  final bool? active;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? name;

  CategoryModel({
    this.id,
    this.arName,
    this.enName,
    this.image,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.name,
  });

  /*factory CategoryModel.fromJsonArray(Map<String, dynamic> json) {
    final List<dynamic> result = json['result'];
    return result.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
  }*/
  static List<CategoryModel> fromJsonArray(Map<String, dynamic> json) {
    final List<dynamic> result = json['result'];
    return result.map<CategoryModel>((e) => CategoryModel.fromJson(e)).toList();
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      arName: json['ar_name'],
      enName: json['en_name'],
      image: json['image'],
      active: json['active'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      name: json['name'],
    );
  }
}
