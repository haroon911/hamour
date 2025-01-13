import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';
import 'package:hamour/core/constants/api_links.dart';

class RepositryData {
  Crud crud;
  RepositryData(this.crud);
  addProduct({required String storeId, required String productId}) async {
    var response = await crud.postData(ApiLinks.addOnStore, {
      "store_id": storeId,
      "product_id": productId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  removeProduct({required String storeId, required String productId}) async {
    var response = await crud.postData(ApiLinks.removeFromStore, {
      "store_id": storeId,
      "product_id": productId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  viewProduct({required String storeId}) async {
    var response = await crud.postData(ApiLinks.storeProducts, {
      "store_id": storeId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
