import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';
import 'roles.dart';

class SupplierSignUpController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController conformPasswordController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController taxNumberController;
  bool remember = false;
  Role role = Role.supplier;
  bool obscureText = true;

  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    taxNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    taxNumberController.dispose();
    super.dispose();
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoute.login);
    // Get.delete<SupplierSignUpController>();
  }

  signUpPressed() {
    Get.offNamed(AppRoute.signupVerificationScreen);
    // Get.delete<SupplierSignUpController>();
  }

  goToSignUpScreen() {
    Get.offNamed(AppRoute.signUp);
    // Get.delete<SupplierSignUpController>();
  }
}
