import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class ResetVerificationController extends GetxController {
  late String verifyCode;

  goToResetPassword() {
    Get.offAllNamed(AppRoute.resetPasswordScreen);
    // Get.delete<ResetVerificationController>();
  }
  resendVerificationCode() {
  }
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
    // Get.delete<ResetVerificationController>();
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
}
