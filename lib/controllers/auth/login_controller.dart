import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/constants/route_names.dart';

class LoginController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool remember = false;
  bool obscureText = true;
  HamourServices hamourServices = Get.find();
  StatusRequest statusRequest = StatusRequest.noState;
  LoginData loginData = LoginData(Get.find());
  List data = [];
  showPassword() {
    obscureText = !obscureText;
    update();
  }

  @override
  void onInit() {
    if (Platform.isAndroid || Platform.isIOS) {
      FirebaseMessaging.instance.getToken().then(
        (value) {
          String? token = value;
          debugPrint(token);
        },
      );
    }
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
    remember
        ? hamourServices.sharedPrefrences.setString("step", "2")
        : hamourServices.sharedPrefrences.setString("step", "1");
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
    var response = await loginData.getData(
        email: emailController.text, password: passwordController.text);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        hamourServices.sharedPrefrences
            .setString("id", response['data']['id'].toString());
        hamourServices.sharedPrefrences
            .setString("role_id", response['data']['role_id'].toString());
        hamourServices.sharedPrefrences
            .setString("email", response['data']['email']);
        hamourServices.sharedPrefrences
            .setString("phone_number", response['data']['phone_number']);
        hamourServices.sharedPrefrences
            .setString("name", response['data']['name']);
        // hamourServices.sharedPrefrences.setString("wallet_id", value);
        // hamourServices.sharedPrefrences.setString("created_date", value);

        // if the user checked on remember me at login he will always go to homepage else he will go to login

        debugPrint(hamourServices.sharedPrefrences.get("step").toString());
        //here we make sure if the user is merchant or supplier so we can navigate him to the right screen
        if ("${response['data']['role_id']}" == "1") {
          // hamourServices.sharedPrefrences.setString("profile_image", value);
          // hamourServices.sharedPrefrences.setString("details", value);
          Get.offNamed(AppRoute.homePage);
        } else if ("${response['data']['role_id']}" == "2") {
          //change the route later to supplier home page
          Get.offNamed(AppRoute.homePage);
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
