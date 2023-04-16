import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/auth/login_controller.dart';

import '../../../../core/functions/auth_app_bar.dart';
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
    Get.lazyPut(() => LoginController());
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(26.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.warehouse_rounded,
                    size: 130, color: Theme.of(context).primaryColor),
                const AuthIntroduction(title: 'login', subTitle: 'loginText'),
                LoginForm(formKey: formKey),
                const RememberForgotRow(),
                SizedBox(height: SizeConfig.getProperateHight(20)),
                AuthButton(
                    title: 'login',
                    onPressed: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    }),
                SizedBox(height: SizeConfig.getProperateHight(20)),
                const Socials(),
                GetBuilder<LoginController>(builder: (controller) {
                  return AuthRecommendation(
                      question: "don't have and account?",
                      recommend: "signup",
                      onTap: () => controller.goToSignupScreen());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
