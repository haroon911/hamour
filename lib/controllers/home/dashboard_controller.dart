import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/services/services.dart';

class DashBoardController extends GetxController {
  HamourServices hamourServices = Get.find();

  signout() {
    hamourServices.sharedPrefrences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
