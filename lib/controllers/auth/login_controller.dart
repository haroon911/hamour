import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool remember = false;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  changeCheck(value) {
    remember = value;
    update();
  }

  goToSignupScreen() {
    Get.toNamed(AppRoute.signUp);
  }

  goToForgetPassword() {
    Get.toNamed(AppRoute.forgotPasswordScreen);
  }
}
