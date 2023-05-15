import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

translateDb({enColumn, arColumn}) {
  HamourServices hamourServices = Get.find();
  if (hamourServices.sharedPrefrences.getString("lang") == "ar") {
    return arColumn;
  } else {
    return enColumn;
  }
}
