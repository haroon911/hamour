import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  getData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(ApiLinks.login, {
      "email": email,
      "password": password,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
