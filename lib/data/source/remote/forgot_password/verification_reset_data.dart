import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class VerificationResetData {
  Crud crud;
  VerificationResetData(this.crud);
  postVerificationResetData({
    required String email,
    required String verificationCode,
  }) async {
    var response = await crud.postData(ApiLinks.verificationReset, {
      "email": email,
      "verification_code": verificationCode,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
