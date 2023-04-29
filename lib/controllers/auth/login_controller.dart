import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/data/source/remote/auth/login_data.dart';

import '../../core/constants/route_names.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool remember = false;
  bool obscureText = true;
  StatusRequest statusRequest = StatusRequest.noState;
  LoginData loginData = LoginData(Get.find());
  List data = [];
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    // FirebaseMessaging.instance.getToken().then();
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
    // Get.delete<LoginController>();
  }

  goToForgetPassword() {
    Get.offNamed(AppRoute.forgotPasswordScreen);
    // Get.delete<LoginController>();
  }

  @override
  void onReady() {
    Get.snackbar('appName'.tr, 'welcome'.tr);
    super.onReady();
  }

  onLogin() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await loginData.postLoginData(
        email: emailController.text, password: passwordController.text);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        if ("${response['data']['role_id']}" == "1") {
          Get.offNamed(AppRoute.storeHomePage);
        } else {
          //change the route later to supplier home page
          Get.offNamed(AppRoute.storeHomePage);
        }
      } else {
        Get.defaultDialog(title: "warning".tr, content: Text("notExist".tr));
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
