import 'package:flutter/foundation.dart';
import 'package:hamour/core/classes/crud.dart';
import 'package:hamour/core/constants/api_links.dart';

class HamourApi with Crud {
 getAllProductsData() async {
    var response = await postData(ApiLinks.products, {});
    debugPrint('"---------"+$response');
    return response.fold((l) => l, (r) => r);
  }
}