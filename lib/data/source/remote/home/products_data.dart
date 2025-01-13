// import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);
  getAllData({
    required String categoryId,
    String? storeId,
  }) async {
    var response = await crud.postData(
      ApiLinks.products,
      storeId==null?{
        "category_id": categoryId,
      }:{
        "category_id": categoryId,
        "store_id":storeId
      }
    );
    // debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
