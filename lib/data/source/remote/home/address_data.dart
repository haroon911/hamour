import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';
import 'package:hamour/core/constants/api_links.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);
  addAddress({
    required String storeId,
    required double latitude,
    required double longitude,
    required double street,
    required double city,
    required double country,
    required double details,
  }) async {
    var response = await crud.postData(ApiLinks.addressAdd, {
      "store_id": storeId,
      "latitude": latitude,
      "longitude": longitude,
      "street": street,
      "city": city,
      "country": country,
      "details": details,
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
  }) async {
    var response = await crud.postData(ApiLinks.addressUpdate, {
      "address_id": addressId,
      "latitude": latitude,
      "longitude": longitude,
      "street": street,
      "city": city,
      "country": country,
      "details": details,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  removeProduct({required String addressId}) async {
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
