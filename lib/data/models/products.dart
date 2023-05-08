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
    int supplierId;
    int categoryId;
    DateTime createdDate;
    DateTime updatedDate;
    int catId;
    String catName;
    String catNameEn;
    int catParentId;
    int catLevel;
    String catImage;
    String catCode;
    int catStatus;
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
        required this.supplierId,
        required this.categoryId,
        required this.createdDate,
        required this.updatedDate,
        required this.catId,
        required this.catName,
        required this.catNameEn,
        required this.catParentId,
        required this.catLevel,
        required this.catImage,
        required this.catCode,
        required this.catStatus,
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
        int? supplierId,
        int? categoryId,
        DateTime? createdDate,
        DateTime? updatedDate,
        int? catId,
        String? catName,
        String? catNameEn,
        int? catParentId,
        int? catLevel,
        String? catImage,
        String? catCode,
        int? catStatus,
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
            supplierId: supplierId ?? this.supplierId,
            categoryId: categoryId ?? this.categoryId,
            createdDate: createdDate ?? this.createdDate,
            updatedDate: updatedDate ?? this.updatedDate,
            catId: catId ?? this.catId,
            catName: catName ?? this.catName,
            catNameEn: catNameEn ?? this.catNameEn,
            catParentId: catParentId ?? this.catParentId,
            catLevel: catLevel ?? this.catLevel,
            catImage: catImage ?? this.catImage,
            catCode: catCode ?? this.catCode,
            catStatus: catStatus ?? this.catStatus,
            images: images ?? this.images,
        );

    factory Products.fromRawJson(String str) => Products.fromJson(json.decode(str));

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
        supplierId: json["supplier_id"],
        categoryId: json["category_id"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
        catId: json["cat_id"],
        catName: json["cat_name"],
        catNameEn: json["cat_name_en"],
        catParentId: json["cat_parent_id"],
        catLevel: json["cat_level"],
        catImage: json["cat_image"],
        catCode: json["cat_code"],
        catStatus: json["cat_status"],
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
        "supplier_id": supplierId,
        "category_id": categoryId,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
        "cat_id": catId,
        "cat_name": catName,
        "cat_name_en": catNameEn,
        "cat_parent_id": catParentId,
        "cat_level": catLevel,
        "cat_image": catImage,
        "cat_code": catCode,
        "cat_status": catStatus,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
