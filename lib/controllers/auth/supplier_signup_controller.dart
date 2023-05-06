import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';

import '../../core/classes/status_request.dart';
import '../../core/constants/app_routes_names.dart';
import '../../data/source/remote/auth/signup_data.dart';
import 'roles.dart';

class SupplierSignUpController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController conformPasswordController;
  late TextEditingController supplierNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController commercialNumberController;
  bool remember = false;
  Role role = Role.supplier;
  bool obscureText = true;

  SignUpData signUpData = SignUpData(Get.find());

  StatusRequest statusRequest = StatusRequest.noState;
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    conformPasswordController = TextEditingController();
    supplierNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    commercialNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    conformPasswordController.dispose();
    supplierNameController.dispose();
    phoneNumberController.dispose();
    commercialNumberController.dispose();
    super.dispose();
  }

  goToLoginScreen() {
    Get.offAllNamed(AppRoute.login);
    // Get.delete<SupplierSignUpController>();
  }

  onSupplierSignUp() async {
    await _getData();
  }

  goToSignUpScreen() {
    Get.offNamed(AppRoute.signUp);
    // Get.delete<SupplierSignUpController>();
  }

  _getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postSupplierData(
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneNumberController.text,
      supplierName: supplierNameController.text,
      commercialNumber: commercialNumberController.text,
    );
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.signupVerificationScreen,
            arguments: {"email": emailController.text});
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
