import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/supplier_signup_controller.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_button.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/signup/supplier_signup_form.dart';
import '../../../components/size_configuration.dart';

class SupplierSignUpSceen extends StatelessWidget {
  SupplierSignUpSceen({super.key});
  final SupplierSignUpController controller =
      Get.put(SupplierSignUpController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                const AuthIntroduction(title: 'signup', subTitle: 'signupText'),
                SupplierSignUpForm(formKey: formKey),
                SizedBox(height: SizeConfig.getProperateHight(20)),
                AuthButton(
                    title: 'signup',
                    onPressed: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    }),
                // SizedBox(height: SizeConfig.getProperateHight(20)),
                AuthRecommendation(
                    question: "already a user?",
                    recommend: "login",
                    onTap: () => controller.goToLoginScreen()),
                AuthRecommendation(
                    question: "sign up as",
                    recommend: "store",
                    onTap: () => controller.goToSignUpScreen()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
