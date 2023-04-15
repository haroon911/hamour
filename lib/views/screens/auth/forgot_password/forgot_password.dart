import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/forgot_pass_controller.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_button.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/forgot_password/forgot_password.dart';
import '../../../components/size_configuration.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final ForgotPassowrdController controller =
      Get.put(ForgotPassowrdController());
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
                Icon(Icons.warehouse_rounded,
                    size: 130, color: Theme.of(context).primaryColor),
                const AuthIntroduction(
                    title: 'forgotPassword', subTitle: 'forgotPasswordText'),
                ForgotPasswordForm(formKey: formKey),
                SizedBox(height: SizeConfig.getProperateHight(20)),
                AuthButton(
                    title: 'send',
                    onPressed: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        controller.goToVarificationScreen();
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
