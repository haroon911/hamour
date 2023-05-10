import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

import '../constants/app_routes_names.dart';

class HamourMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  HamourServices hamourServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (hamourServices.sharedPrefrences.getString("step") == "2") {
      return const RouteSettings(name: AppRoutes.homePage);
    } else if (hamourServices.sharedPrefrences.getString("step") == "1") {
      return const RouteSettings(name: AppRoutes.login);
    }
    return super.redirect(route);
  }
}
