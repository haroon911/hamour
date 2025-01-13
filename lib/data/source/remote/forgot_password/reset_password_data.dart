import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  getData({
    required String email,
    required String password,
  }) async {
    var response = await crud.postData(ApiLinks.resetPassword, {
      "email": email,
      "password": password,
    });
    debugPrint('"---------"+$response  and password = $email');

    return response.fold((l) => l, (r) => r);
  }
}
