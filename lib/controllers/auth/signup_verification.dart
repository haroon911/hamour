import 'package:get/get.dart';
import '../../core/constants/route_names.dart';

class SignUpVerificationController extends GetxController {
  late String verifyCode;

  goToSuccessfullSignUpScreen() {
    Get.toNamed(AppRoute.successfullSignUpScreen);
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }

}
