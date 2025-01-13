import 'package:get/get.dart';

import '../../core/constants/app_routes_names.dart';

class VerificationSuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
    // Get.delete<VerificationSuccessController>();
  }
}
