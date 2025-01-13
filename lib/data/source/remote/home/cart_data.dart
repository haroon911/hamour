import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';
import 'package:hamour/core/constants/api_links.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addProduct({required String storeId, required String productId}) async {
    var response = await crud.postData(ApiLinks.cartAdd, {
      "store_id": storeId,
      "product_id": productId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  removeProduct({required String storeId, required String productId}) async {
    var response = await crud.postData(ApiLinks.cartRemove, {
      "store_id": storeId,
      "product_id": productId,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }

  getProductQuantity(
      {required String storeId, required String productId}) async {
    var response = await crud.postData(ApiLinks.cartProdcutQuantity, {
      "store_id": storeId,
      "product_id": productId,
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
