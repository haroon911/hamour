import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postEmailData({
    required String email,

  }) async {
    var response = await crud.postData(ApiLinks.checkEmail, {
      "email": email,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
