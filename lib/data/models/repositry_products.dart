// To parse this JSON data, do
//
//     final repositryProducts = repositryProductsFromJson(jsonString);

import 'dart:convert';

class RepositryProducts {
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
    int storeId;
    int repoId;
    int repoActive;
    DateTime repoAddDate;
    DateTime repoEndDate;
    List<String> images;

    RepositryProducts({
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
        required this.storeId,
        required this.repoId,
        required this.repoActive,
        required this.repoAddDate,
        required this.repoEndDate,
        required this.images,
    });

    RepositryProducts copyWith({
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
        int? storeId,
        int? repoId,
        int? repoActive,
        DateTime? repoAddDate,
        DateTime? repoEndDate,
        List<String>? images,
    }) => 
        RepositryProducts(
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
            storeId: storeId ?? this.storeId,
            repoId: repoId ?? this.repoId,
            repoActive: repoActive ?? this.repoActive,
            repoAddDate: repoAddDate ?? this.repoAddDate,
            repoEndDate: repoEndDate ?? this.repoEndDate,
            images: images ?? this.images,
        );

    factory RepositryProducts.fromRawJson(String str) => RepositryProducts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RepositryProducts.fromJson(Map<String, dynamic> json) => RepositryProducts(
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
        storeId: json["store_id"],
        repoId: json["repo_id"],
        repoActive: json["repo_active"],
        repoAddDate: DateTime.parse(json["repo_add_date"]),
        repoEndDate: DateTime.parse(json["repo_end_date"]),
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
        "store_id": storeId,
        "repo_id": repoId,
        "repo_active": repoActive,
        "repo_add_date": repoAddDate.toIso8601String(),
        "repo_end_date": repoEndDate.toIso8601String(),
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
