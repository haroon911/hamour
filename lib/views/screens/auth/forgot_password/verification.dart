import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/reset_verification_controller.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/Widgets/recommendation.dart';
import '../../../components/auth/forgot_password/otp_input.dart';
import '../../../components/auth/forgot_password/build_timer.dart';
import '../../../components/size_configuration.dart';

class ResetVerificationScreen extends StatelessWidget {
  ResetVerificationScreen({super.key});
  final ResetVerificationController controller =
      Get.put(ResetVerificationController());
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
                const AuthIntroduction(
                  title: 'varification',
                  subTitle: 'varificationText',
                  extra: "haroon@gamil.com",
                ),
                const BuildTimer(),
                SizedBox(
                  height: SizeConfig.getProperateHight(16),
                ),
                OtpInput(
                  onSubmit: (verificationCode) {
                    controller.goToResetPassword();
                  },
                ),
                SizedBox(height: SizeConfig.getProperateHight(16)),
                const AuthRecommendation(
                    question: 'codeNotSend', recommend: 'resend'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
