import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/auth/login_controller.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/image_assets.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/functions/auth_app_bar.dart';
import '../../../../core/functions/exite_app_alert.dart';
import '../../../components/auth/Widgets/auth_button.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/Widgets/socials.dart';
import '../../../components/auth/login/login_form.dart';
import '../../../components/auth/login/remember_forgot.dart';
import '../../../components/size_configuration.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => LoginController());
    Get.put(LoginController());
    return Scaffold(
      appBar: myAppBar(),
      body: GetBuilder<LoginController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(child: Lottie.asset(ImageAssets.loading1))
            : SingleChildScrollView(
                child: Align(
                  alignment: Alignment.center,
                  child: WillPopScope(
                    onWillPop: () => exitAppAlert(),
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      padding: const EdgeInsets.all(26.0),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warehouse_rounded,
                              size: 130, color: Theme.of(context).primaryColor),
                          const AuthIntroduction(
                              title: 'login', subTitle: 'loginText'),
                          LoginForm(formKey: formKey),
                          const RememberForgotRow(),
                          SizedBox(height: SizeConfig.getProperateHight(20)),
                          AuthButton(
                              title: 'login',
                              onPressed: () {
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  controller.onLogin();
                                }
                              }),
                          SizedBox(height: SizeConfig.getProperateHight(20)),
                          const Socials(),
                          AuthRecommendation(
                              question: "don't have and account?",
                              recommend: "signup",
                              onTap: () => controller.goToSignupScreen()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
