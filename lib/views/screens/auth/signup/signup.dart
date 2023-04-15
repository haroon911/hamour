import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/signup_controller.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_button.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/Widgets/socials.dart';
import '../../../components/auth/signup/signup_form.dart';
import '../../../components/size_configuration.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final SignUpController controller = Get.put(SignUpController());
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
                SignUpForm(formKey: formKey),
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
                const Socials(),
                AuthRecommendation(
                    question: "sign up as",
                    recommend: "supplier",
                    onTap: () => controller.goToSupplierSignUp()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
