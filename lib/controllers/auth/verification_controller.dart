import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class VerificationController extends GetxController {
  late String verifyCode;

  goToResetPassword() {
    Get.toNamed(AppRoute.resetPasswordScreen);
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }

}
