import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class CategoriesData {
  Crud crud;
  CategoriesData(this.crud);
  getData() async {
    var response = await crud.postData(ApiLinks.categories, {"level": "1"});
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
