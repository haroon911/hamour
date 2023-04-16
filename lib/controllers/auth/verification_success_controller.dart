import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

class VerificationSuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
  }
}
