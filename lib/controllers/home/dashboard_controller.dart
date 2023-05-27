import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/services/services.dart';

class DashBoardController extends GetxController {
  HamourServices hamourServices = Get.find();
  late String name;
  late String email;
  late int balance;

  // resetBalance() {
  //   balance = hamourServices.sharedPrefrences.getInt("balance")!;
  //   update();
  // }

  goToOrder() {
    Get.toNamed(AppRoutes.walletScreen);
  }

  signout() {
    hamourServices.sharedPrefrences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  initialVariables() {
    name = hamourServices.sharedPrefrences.getString("name")!;
    balance = hamourServices.sharedPrefrences.getInt("balance")!;
    email = hamourServices.sharedPrefrences.getString("email")!;
    update();
  }

  @override
  void onInit() {
    initialVariables();
    super.onInit();
  }
}
