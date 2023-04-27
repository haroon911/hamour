import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/classes/status_request.dart';
import '../../core/constants/route_names.dart';
import '../../core/functions/data_handler_controller.dart';
import '../../data/source/remote/auth/verification_signup.dart';

class SignUpVerificationController extends GetxController {
  VerificationSignUpData verificationSignUpData =
      VerificationSignUpData(Get.find());
  late String verificationCode;
  String? email;
  StatusRequest? statusRequest;
  @override
  onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  goToVerificationSuccess() {
    Get.offNamed(AppRoute.verificationSuccess);
    // Get.delete<SignUpVerificationController>();
  }

  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
    // Get.delete<SignUpVerificationController>();
  }

  resendVerificationCode() {}

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
  _getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verificationSignUpData.postVerificationData(
        email: email!, verificationCode: verificationCode);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.verificationSuccess);
      } else {
        Get.defaultDialog(title: "warning".tr, content: Text("userExist".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
