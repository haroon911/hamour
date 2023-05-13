import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData( int parentId) async {
    var response = await crud.postData(ApiLinks.home, {"parent_id":parentId.toString() });
    debugPrint('"---------"+$response');
    
    return response.fold((l) => l, (r) => r);
  }
}
