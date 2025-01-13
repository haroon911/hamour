import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class SearchData {
  Crud crud;
  SearchData(this.crud);
  searchData({required String search, String? storeId}) async {
    dynamic response;
    storeId == null
        ? response = await crud
            .postData(ApiLinks.searchProducts, {"search": search.toString()})
        : response = await crud.postData(ApiLinks.searchProducts,
            {"search": search.toString(), "store_id": storeId});
    debugPrint('"---------"+$response');

    return response.fold((l) => l, (r) => r);
  }
}
