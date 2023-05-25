// To parse this JSON data, do
//
//     final address = addressFromJson(jsonString);

import 'dart:convert';
class Address {
    int id;
    int storeId;
    double latitude;
    double longitude;
    String street;
    String city;
    String country;
    String details;
    Address({
        required this.id,
        required this.storeId,
        required this.latitude,
        required this.longitude,
        required this.street,
        required this.city,
        required this.country,
        required this.details,
    });

    Address copyWith({
        int? id,
        int? storeId,
        double? latitude,
        double? longitude,
        String? street,
        String? city,
        String? country,
        String? details,
    }) => 
        Address(
            id: id ?? this.id,
            storeId: storeId ?? this.storeId,
            latitude: latitude ?? this.latitude,
            longitude: longitude ?? this.longitude,
            street: street ?? this.street,
            city: city ?? this.city,
            country: country ?? this.country,
            details: details ?? this.details,
        );

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        storeId: json["store_id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        street: json["street"],
        city: json["city"],
        country: json["country"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "store_id": storeId,
        "latitude": latitude,
        "longitude": longitude,
        "street": street,
        "city": city,
        "country": country,
        "details": details,
    };
}
