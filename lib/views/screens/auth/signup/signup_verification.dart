import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/functions/exite_app_alert.dart';
import '../../../../controllers/auth/signup_verification.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/forgot_password/otp_input.dart';
import '../../../components/size_configuration.dart';

class SignUpVerificationScreen extends StatelessWidget {
  SignUpVerificationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpVerificationController());
    return Scaffold(
      appBar: myAppBar(),
      body: WillPopScope(
        onWillPop: () => exitAppAlert(),
        child: GetBuilder<SignUpVerificationController>(
          builder: (controller) => DataRequestHandler(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 800),
                  padding: const EdgeInsets.all(26.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthIntroduction(
                        title: 'varification',
                        subTitle: 'varificationText',
                        extra: "${controller.email}",
                      ),
                      OtpInput(
                        onSubmit: (verificationCode) {
                          controller.verificationCode = verificationCode;
                          controller.goToVerificationSuccess();
                        },
                      ),
                      SizedBox(height: SizeConfig.getProperateHight(16)),
                      AuthRecommendation(
                        question: 'codeNotSend',
                        recommend: 'resend',
                        onTap: () => controller.resendVerificationCode(),
                      ),
                      AuthRecommendation(
                        question: 'goBack',
                        recommend: 'signup',
                        onTap: () => controller.goToSignUp(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
