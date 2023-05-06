// To parse this JSON data, do
//
//     final offers = offersFromJson(jsonString);

import 'dart:convert';

class Offers {
  int id;
  String image;
  int active;
  DateTime createdDate;
  DateTime updatedDate;

  Offers({
    required this.id,
    required this.image,
    required this.active,
    required this.createdDate,
    required this.updatedDate,
  });

  Offers copyWith({
    int? id,
    String? image,
    int? active,
    DateTime? createdDate,
    DateTime? updatedDate,
  }) =>
      Offers(
        id: id ?? this.id,
        image: image ?? this.image,
        active: active ?? this.active,
        createdDate: createdDate ?? this.createdDate,
        updatedDate: updatedDate ?? this.updatedDate,
      );

  factory Offers.fromRawJson(String str) => Offers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        id: json["id"],
        image: json["image"],
        active: json["active"],
        createdDate: DateTime.parse(json["created_date"]),
        updatedDate: DateTime.parse(json["updated_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "active": active,
        "created_date": createdDate.toIso8601String(),
        "updated_date": updatedDate.toIso8601String(),
      };
}
