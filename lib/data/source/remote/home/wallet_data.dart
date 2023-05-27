import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class WalletData {
  Crud crud;
  WalletData(this.crud);
  addBalance({
    required String userId,
    required String balance,
    String? cardInfo,
  }) async {
    var response = await crud.postData(ApiLinks.walletAdd, {
      "user_id": userId,
      "balance": balance,
      // "cardInfo": cardInfo,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
