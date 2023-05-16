import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/auth/login_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/constants/app_routes_names.dart';

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
    Get.toNamed(AppRoutes.signUp);
    // Get.delete<LoginController>();
  }

  goToForgetPassword() {
    Get.offNamed(AppRoutes.forgotPasswordScreen);
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
        if (response["data"]["approved"] == 1) {
          hamourServices.sharedPrefrences
              .setString("id", response['data']['id'].toString());
          hamourServices.sharedPrefrences
              .setString("role_id", response['data']['role_id'].toString());
          hamourServices.sharedPrefrences
              .setString("email", response['data']['email']);
          hamourServices.sharedPrefrences
              .setString("phone_number", response['data']['phone_number']);
          // hamourServices.sharedPrefrences
          //     .setString("name", response['data']['name']);
          // hamourServices.sharedPrefrences.setString("wallet_id", value);
          // hamourServices.sharedPrefrences.setString("created_date", value);
          // if the user checked on remember me at login he will always go to homepage else he will go to login

          debugPrint(hamourServices.sharedPrefrences.get("step").toString());
          //here we make sure if the user is merchant or supplier so we can navigate him to the right screen
          if (response['data']['role_id'] == 1) {
            hamourServices.sharedPrefrences
                .setString("store_id", response['data']['store_id'].toString());
            // hamourServices.sharedPrefrences.setString("details", value);
            debugPrint(hamourServices.sharedPrefrences.getString("store_id"));
            Get.offNamed(AppRoutes.homePage);
          } else if (response['data']['role_id'] == 2) {
            hamourServices.sharedPrefrences.setString(
                "supplier_id", response['data']['supplier_id'].toString());
            //change the route later for supplier home page
            Get.offNamed(AppRoutes.homePage);
          }
        } else {
          Get.toNamed(AppRoutes.signupVerificationScreen,
              arguments: {"email": emailController.text});
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
