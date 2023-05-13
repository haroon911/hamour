// import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);
  getAllData({
    required String categoryId,
  }) async {
    var response = await crud.postData(
      ApiLinks.products,
      {
        "category_id": categoryId,
      },
    );
    // debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
