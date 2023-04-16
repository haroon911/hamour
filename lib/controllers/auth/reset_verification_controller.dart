import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class ResetVerificationController extends GetxController {
  late String verifyCode;

  goToResetPassword() {
    Get.offAllNamed(AppRoute.resetPasswordScreen);
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
}
