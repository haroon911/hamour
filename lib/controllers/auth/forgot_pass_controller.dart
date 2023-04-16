import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

class ForgotPassowrdController extends GetxController {
  late TextEditingController emailController;

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

  goToVarificationScreen() {
    Get.offNamed(AppRoute.resetVerificationScreen);
    // Get.delete<ForgotPassowrdController>();
  }

  goToLoginScreen() {
    Get.offNamed(AppRoute.login);
    // Get.delete<ForgotPassowrdController>();
  }
}
