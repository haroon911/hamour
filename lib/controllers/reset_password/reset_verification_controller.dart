import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/data/source/remote/forgot_password/verification_reset_data.dart';
import '../../core/constants/route_names.dart';

class ResetVerificationController extends GetxController {
  late String verificationCode;
  String? email;
  StatusRequest statusRequest = StatusRequest.noState;
  VerificationResetData verificationResetData =
      VerificationResetData(Get.find());
  @override
  onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  goToResetPassword() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verificationResetData.getData(
        email: email!, verificationCode: verificationCode);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPasswordScreen,
            arguments: {"email": email!});
      } else {
        Get.defaultDialog(
            title: "warning".tr, content: Text("verificationErrText".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();

    // Get.offAllNamed(AppRoute.resetPasswordScreen);
    // Get.delete<ResetVerificationController>();
  }

  resendVerificationCode() {}
  goToLogin() {
    Get.offAllNamed(AppRoute.login);
    // Get.delete<ResetVerificationController>();
  }

  checkVerificationCode() {
    // Get.toNamed(AppRoute.login);
  }
}
