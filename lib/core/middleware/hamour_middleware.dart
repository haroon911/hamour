import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

import '../constants/route_names.dart';

class HamourMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;
  HamourServices hamourServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (hamourServices.sharedPrefrences.getBool("finishOnboarding") == true) {
      return const RouteSettings(name: AppRoute.login);
    }
    return super.redirect(route);
  }
}
