import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/data/source/remote/forgot_password/reset_password_data.dart';

import '../../core/constants/app_routes_names.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPasswordController;
  late TextEditingController conformPasswordController;
  bool obscureText = true;
  String? email;
  StatusRequest statusRequest = StatusRequest.noState;
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    newPasswordController = TextEditingController();
    conformPasswordController = TextEditingController();
    email = Get.arguments['email'];

    super.onInit();
  }

  goToVerificationSuccess() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await resetPasswordData.getData(
        email: email!, password: newPasswordController.text);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.verificationSuccess);
      } else {
        Get.defaultDialog(title: "warning".tr, content: Text("notExist".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();

    // Get.delete<ResetPasswordController>();
  }

  resetPassword() {
    //TODON: code for resetting password goes here
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    conformPasswordController.dispose();
    super.dispose();
  }
}
