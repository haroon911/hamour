// To parse this JSON data, do
//
//     final cartProducts = cartProductsFromJson(jsonString);

import 'dart:convert';

class CartProducts {
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
    int cartId;
    int storeId;
    int cartQuantity;
    DateTime cartDate;
    int aggregatePrice;
    List<String> images;

    CartProducts({
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
        required this.cartId,
        required this.storeId,
        required this.cartQuantity,
        required this.cartDate,
        required this.aggregatePrice,
        required this.images,
    });

    CartProducts copyWith({
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
        int? cartId,
        int? storeId,
        int? cartQuantity,
        DateTime? cartDate,
        int? aggregatePrice,
        List<String>? images,
    }) => 
        CartProducts(
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
            cartId: cartId ?? this.cartId,
            storeId: storeId ?? this.storeId,
            cartQuantity: cartQuantity ?? this.cartQuantity,
            cartDate: cartDate ?? this.cartDate,
            aggregatePrice: aggregatePrice ?? this.aggregatePrice,
            images: images ?? this.images,
        );

    factory CartProducts.fromRawJson(String str) => CartProducts.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CartProducts.fromJson(Map<String, dynamic> json) => CartProducts(
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
        cartId: json["cart_id"],
        storeId: json["store_id"],
        cartQuantity: json["cart_quantity"],
        cartDate: DateTime.parse(json["cart_date"]),
        aggregatePrice: json["aggregate_price"],
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
        "cart_id": cartId,
        "store_id": storeId,
        "cart_quantity": cartQuantity,
        "cart_date": cartDate.toIso8601String(),
        "aggregate_price": aggregatePrice,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}

// To parse this JSON data, do
//
//     final totalPrice = totalPriceFromJson(jsonString);

class TotalCart {
  double totalPrice;
  int totalQuantity;

  TotalCart({
    required this.totalPrice,
    required this.totalQuantity,
  });

  TotalCart copyWith({
    double? totalPrice,
    int? totalQuantity,
  }) =>
      TotalCart(
        totalPrice: totalPrice ?? this.totalPrice,
        totalQuantity: totalQuantity ?? this.totalQuantity,
      );

  factory TotalCart.fromRawJson(String str) =>
      TotalCart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalCart.fromJson(Map<String, dynamic> json) => TotalCart(
        totalPrice: json["total_price"].toDouble(),
        totalQuantity: (json["total_quantity"]).toInt(),
      );

  Map<String, dynamic> toJson() => {
        "total_price": totalPrice,
        "total_quantity": totalQuantity,
      };
}
