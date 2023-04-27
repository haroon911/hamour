import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postStoreData({
    required String storeName,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    var response = await crud.postData(ApiLinks.signup, {
      "store_name": storeName,
      "email": email,
      "password": password,
      "phone_number": phoneNumber,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
  postSupplierData({
    required String supplierName,
    required String email,
    required String password,
    required String phoneNumber,
    required String commercialNumber,
  }) async {
    var response = await crud.postData(ApiLinks.signup, {
      "supplier_name": supplierName,
      "email": email,
      "password": password,
      "phone_number": phoneNumber,
      "commercial_number": commercialNumber,
    });
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
