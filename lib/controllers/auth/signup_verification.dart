import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class SignUpVerificationController extends GetxController {
  late String verificationCode;

  goToVerificationSuccess() {
    Get.toNamed(AppRoute.verificationSuccess);
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
}
