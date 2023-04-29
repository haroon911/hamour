import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/reset_password/reset_password_controller.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_button.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/forgot_password/reset_pass_form.dart';
import '../../../components/size_configuration.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});
  final ResetPasswordController controller = Get.put(ResetPasswordController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: GetBuilder<ResetPasswordController>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? Center(child: Lottie.asset(ImageAssets.loading1))
              : SingleChildScrollView(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 800),
                      padding: const EdgeInsets.all(26.0),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const AuthIntroduction(
                            title: 'resetPassword',
                            subTitle: 'resetPasswordText',
                          ),
                          ResetPasswordForm(formKey: formKey),
                          SizedBox(height: SizeConfig.getProperateHight(20)),
                          AuthButton(
                              title: 'reset',
                              onPressed: () {
                                if (formKey.currentState != null &&
                                    formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  controller.goToVerificationSuccess();
                                }
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
