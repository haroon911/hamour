import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class VerificationSignUpData {
  Crud crud;
  VerificationSignUpData(this.crud);
  postVerificationData({
    required String email,
    required String verificationCode,
  }) async {
    var response = await crud.postData(ApiLinks.signup, {
      "email": email,
      "verification_code": verificationCode,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
