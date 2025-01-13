// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

class Categories {
    int id;
    String name;
    String nameEn;
    int parentId;
    int level;
    int status;
    String image;
    String categoryCode;
    DateTime createdDate;
    DateTime modifiedDate;

    Categories({
        required this.id,
        required this.name,
        required this.nameEn,
        required this.parentId,
        required this.level,
        required this.status,
        required this.image,
        required this.categoryCode,
        required this.createdDate,
        required this.modifiedDate,
    });

    Categories copyWith({
        int? id,
        String? name,
        String? nameEn,
        int? parentId,
        int? level,
        int? status,
        String? image,
        String? categoryCode,
        DateTime? createdDate,
        DateTime? modifiedDate,
    }) => 
        Categories(
            id: id ?? this.id,
            name: name ?? this.name,
            nameEn: nameEn ?? this.nameEn,
            parentId: parentId ?? this.parentId,
            level: level ?? this.level,
            status: status ?? this.status,
            image: image ?? this.image,
            categoryCode: categoryCode ?? this.categoryCode,
            createdDate: createdDate ?? this.createdDate,
            modifiedDate: modifiedDate ?? this.modifiedDate,
        );

    factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        name: json["name"],
        nameEn: json["name_en"],
        parentId: json["parent_id"],
        level: json["level"],
        status: json["status"],
        image: json["image"],
        categoryCode: json["category_code"],
        createdDate: DateTime.parse(json["created_date"]),
        modifiedDate: DateTime.parse(json["modified_date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "name_en": nameEn,
        "parent_id": parentId,
        "level": level,
        "status": status,
        "image": image,
        "category_code": categoryCode,
        "created_date": createdDate.toIso8601String(),
        "modified_date": modifiedDate.toIso8601String(),
    };
}

// // To parse this JSON data, do
// //
// //     final categories = categoriesFromJson(jsonString);

// import 'dart:convert';

// class Categories {
//     final int id;
//     final String name;
//     final String nameEn;
//     final int parentId;
//     final int level;
//     final int status;
//     final String image;
//     final String categoryCode;


//     Categories({
//         required this.id,
//         required this.name,
//         required this.nameEn,
//         required this.parentId,
//         required this.level,
//         required this.status,
//         required this.image,
//         required this.categoryCode,
//     });

//     Categories copyWith({
//         int? id,
//         String? name,
//         String? nameEn,
//         int? parentId,
//         int? level,
//         int? status,
//         String? image,
//         String? categoryCode,
//         DateTime? createdDate,
//         DateTime? modifiedDate,
//     }) => 
//         Categories(
//             id: id ?? this.id,
//             name: name ?? this.name,
//             nameEn: nameEn ?? this.nameEn,
//             parentId: parentId ?? this.parentId,
//             level: level ?? this.level,
//             status: status ?? this.status,
//             image: image ?? this.image,
//             categoryCode: categoryCode ?? this.categoryCode,
//         );

//     factory Categories.fromRawJson(String str) => Categories.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Categories.fromJson(Map<String, dynamic> json) => Categories(
//         id: json["id"],
//         name: json["name"],
//         nameEn: json["name_en"],
//         parentId: json["parent_id"],
//         level: json["level"],
//         status: json["status"],
//         image: json["image"],
//         categoryCode: json["category_code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "name_en": nameEn,
//         "parent_id": parentId,
//         "level": level,
//         "status": status,
//         "image": image,
//         "category_code": categoryCode,
//     };
// }
