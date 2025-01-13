// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

class Products {
  int id;
  String name;
  String nameEn;
  int stock;
  int price;
  double discount;
  String details;
  String detailsEn;
  String brand;
  int status;
  int supplierId;
  int categoryId;
  DateTime createdDate;
  DateTime updatedDate;
  int? onStore;
  List<String> images;

  Products({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.stock,
    required this.price,
    required this.discount,
    required this.details,
    required this.detailsEn,
    required this.brand,
    required this.status,
    required this.supplierId,
    required this.categoryId,
    required this.createdDate,
    required this.updatedDate,
    this.onStore,
    required this.images,
  });

  Products copyWith({
    int? id,
    String? name,
    String? nameEn,
    int? stock,
    int? price,
    double? discount,
    String? details,
    String? detailsEn,
    String? brand,
    int? status,
    int? supplierId,
    int? categoryId,
    DateTime? createdDate,
    DateTime? updatedDate,
    int? onStore,
    List<String>? images,
  }) =>
      Products(
        id: id ?? this.id,
        name: name ?? this.name,
        nameEn: nameEn ?? this.nameEn,
        stock: stock ?? this.stock,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        details: details ?? this.details,
        detailsEn: detailsEn ?? this.detailsEn,
        brand: brand ?? this.brand,
        status: status ?? this.status,
        supplierId: supplierId ?? this.supplierId,
        categoryId: categoryId ?? this.categoryId,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
        images: images ?? this.images,
        onStore: onStore ?? this.onStore,
      );

  factory Products.fromRawJson(String str) =>
      Products.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        nameEn: json["name_en"],
        stock: json["stock"],
        price: json["price"],
        discount: json["discount"]?.toDouble(),
        details: json["details"],
        detailsEn: json["details_en"],
        brand: json["brand"],
        status: json["status"],
        supplierId: json["supplier_id"],
        categoryId: json["category_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        onStore: json["on_store"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_en": nameEn,
        "stock": stock,
        "price": price,
        "discount": discount,
        "details": details,
        "details_en": detailsEn,
        "brand": brand,
        "status": status,
        "supplier_id": supplierId,
        "category_id": categoryId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "on_store": onStore,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
