import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class SignUpVerificationController extends GetxController {
  late String verificationCode;

  goToVerificationSuccess() {
    Get.offNamed(AppRoute.verificationSuccess);
    Get.delete<SignUpVerificationController>();
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
    Get.delete<SignUpVerificationController>();
  }
  resendVerificationCode() {
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
}
