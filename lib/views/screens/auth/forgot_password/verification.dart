import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/reset_password/reset_verification_controller.dart';
import '../../../../core/classes/status_request.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/forgot_password/otp_input.dart';
import '../../../components/auth/forgot_password/build_timer.dart';
import '../../../components/size_configuration.dart';

class ResetVerificationScreen extends StatelessWidget {
  ResetVerificationScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Get.put(ResetVerificationController());
    return Scaffold(
        appBar: myAppBar(),
        body: GetBuilder<ResetVerificationController>(
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
                          AuthIntroduction(
                            title: 'varification',
                            subTitle: 'varificationText',
                            extra: "${controller.email}",
                          ),
                          const BuildTimer(),
                          SizedBox(
                            height: SizeConfig.getProperateHight(16),
                          ),
                          OtpInput(
                            onSubmit: (verificationCode) {
                              controller.verificationCode = verificationCode;
                              controller.goToResetPassword();
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
                            recommend: 'login',
                            onTap: () => controller.goToLogin(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ));
  }
}
