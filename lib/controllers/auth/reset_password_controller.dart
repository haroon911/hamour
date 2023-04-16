import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

class ResetPasswordController extends GetxController {
  late TextEditingController newPasswordController;
  late TextEditingController conformPasswordController;

  @override
  void onInit() {
    newPasswordController = TextEditingController();
    conformPasswordController = TextEditingController();
    super.onInit();
  }

  goToVerificationSuccess() {
    Get.offAllNamed(AppRoute.verificationSuccess);
    Get.delete<ResetPasswordController>();
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
