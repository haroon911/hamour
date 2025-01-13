import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/data/source/remote/forgot_password/check_email_data.dart';

import '../../core/constants/app_routes_names.dart';

class ForgotPassowrdController extends GetxController {
  late TextEditingController emailController;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.noState;
  @override
  void onInit() {
    emailController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  onEmailChecked() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.getData(email: emailController.text);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetVerificationScreen,
            arguments: {"email": emailController.text});
      } else {
        Get.defaultDialog(
            title: "warning".tr, content: Text("EmailnotExist".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  goToLoginScreen() {
    Get.offNamed(AppRoutes.login);
    // Get.delete<ForgotPassowrdController>();
  }
}
