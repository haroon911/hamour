import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/data/source/remote/auth/signup_data.dart';

import '../../core/constants/app_routes_names.dart';
import '../../core/functions/data_handler_controller.dart';
import 'roles.dart';

class SignUpController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController conformPasswordController;
  late TextEditingController storeNameController;
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  Role role = Role.store;
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
    Get.offAllNamed(AppRoutes.login);
    // Get.delete<SignUpController>();
  }

  onSignUp() async {
    await _getData();
  }

  goToSupplierSignUp() {
    Get.offNamed(AppRoutes.supplierSignUpScreen);
    // Get.delete<SignUpController>();
  }

  _getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await signUpData.postStoreData(
      email: emailController.text,
      password: passwordController.text,
      phoneNumber: phoneNumberController.text,
      storeName: storeNameController.text,
    );
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoutes.signupVerificationScreen,
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
