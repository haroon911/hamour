import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/route_names.dart';
import 'roles.dart';

class SignUpController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController conformPasswordController;
  late TextEditingController storeNameController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  Role role = Role.store;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
    storeNameController = TextEditingController();
    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    storeNameController.dispose();
    fullNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoute.login);
    Get.delete<SignUpController>();
  }

  signUpPressed() {
    Get.offAllNamed(AppRoute.signupVerificationScreen);
    Get.delete<SignUpController>();
  }

  goToSupplierSignUp() {
    Get.offNamed(AppRoute.supplierSignUpScreen);
    Get.delete<SignUpController>();
  }
}
