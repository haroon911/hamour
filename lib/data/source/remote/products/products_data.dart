import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class ProductsData {
  Crud crud;
  ProductsData(this.crud);
  getAllData() async {
    var response = await crud.postData(ApiLinks.products, {});
    debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
