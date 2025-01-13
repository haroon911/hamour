class AddOrderModel {
  final double latitude;
  final double longitude;
  final String storeId;
  final String customerName;
  final String phone;
  final String city;
  final String country;
  final String details;
  final String street;
  final String distance;

  AddOrderModel({
    required this.latitude,
    required this.longitude,
    required this.storeId,
    required this.customerName,
    required this.phone,
    required this.city,
    required this.country,
    required this.details,
    required this.street,
    required this.distance,
  });
  AddOrderModel copyWith({
    double? latitude,
    double? longitude,
    String? storeId,
    String? customerName,
    String? phone,
    String? city,
    String? country,
    String? details,
    String? street,
    String? distance,
  }) {
    return AddOrderModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.latitude,
      storeId: storeId ?? this.storeId,
      customerName: customerName ?? this.customerName,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      country: country ?? this.country,
      details: details ?? this.details,
      street: street ?? this.street,
      distance: distance ?? this.distance,
    );
  }
}
