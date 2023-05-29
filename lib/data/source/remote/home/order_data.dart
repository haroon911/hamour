import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/data/models/add_order_model.dart';

class OrderData {
  Crud crud;
  OrderData(this.crud);
  addOrder({
    required AddOrderModel addOrderModel,
  }) async {
    var response = await crud.postData(ApiLinks.orderAdd, {
      "store_id": addOrderModel.storeId,
      "latitude": addOrderModel.latitude.toString(),
      "longitude": addOrderModel.longitude.toString(),
      "street": addOrderModel.street,
      "city": addOrderModel.city,
      "country": addOrderModel.country,
      "details": addOrderModel.details,
      "customer_name": addOrderModel.customerName,
      "phone": addOrderModel.phone,
      "distance": addOrderModel.distance,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  updateAddress({
    required String addressId,
    required double latitude,
    required double longitude,
    required double street,
    required double city,
    required double country,
    required double details,
    required double distance,
  }) async {
    var response = await crud.postData(ApiLinks.addressUpdate, {
      "address_id": addressId,
      "latitude": latitude,
      "longitude": longitude,
      "street": street,
      "city": city,
      "country": country,
      "details": details,
      "customer_name": distance,
      "phone_number": distance,
      "distance": distance,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  removeAddress({required String addressId}) async {
    var response = await crud.postData(ApiLinks.addressRemove, {
      "address_id": addressId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  viewCart({required String storeId}) async {
    var response = await crud.postData(ApiLinks.cartView, {
      "store_id": storeId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
