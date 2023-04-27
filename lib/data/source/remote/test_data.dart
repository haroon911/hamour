import 'package:flutter/material.dart';

import '../../../core/classes/crud.dart';
import '../../../core/constants/api_links.dart';

class TestData {
  Crud crud;
  TestData(this.crud);
  getData() async {
    var response = await crud.postData(ApiLinks.test, {});
    debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}
