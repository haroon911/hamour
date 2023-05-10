import 'package:flutter/material.dart';
import 'package:hamour/core/classes/crud.dart';

import '../../../../core/constants/api_links.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);
  getData(int level , int parentId) async {
    var response = await crud.postData(ApiLinks.home, {"level":level.toString() ,"parent_id":parentId.toString() });
    debugPrint('"---------"+$response');
    
    return response.fold((l) => l, (r) => r);
  }
}
