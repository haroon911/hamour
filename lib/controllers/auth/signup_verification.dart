import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/constants/app_routes_names.dart';
import '../../core/functions/data_handler_controller.dart';
import '../../data/source/remote/auth/verification_signup.dart';

class SignUpVerificationController extends GetxController {
  VerificationSignUpData verificationSignUpData =
      VerificationSignUpData(Get.find());
  late String verificationCode;
  String? email;
  StatusRequest statusRequest = StatusRequest.noState;
  @override
  onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  goToSignUp() {
    Get.offNamed(AppRoutes.signUp);
    // Get.delete<SignUpVerificationController>();
  }

  int counter = 1;
  resendVerificationCode() {
    if (counter <= 3) {
      verificationSignUpData.resendVerification(email: email!);
    } else {
      Get.rawSnackbar(title: "warning".tr , messageText: Text("too_many_attempts".tr));

    }
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
  goToVerificationSuccess() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verificationSignUpData.postVerificationData(
        email: email!, verificationCode: verificationCode);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.verificationSuccess);
      } else {
        Get.defaultDialog(
            title: "warning".tr, content: Text("verificationErrText".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
