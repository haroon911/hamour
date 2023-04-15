import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/auth/verification_controller.dart';
import '../../../../core/functions/auth_app_bar.dart';
import '../../../components/auth/Widgets/auth_intro.dart';
import '../../../components/auth/forgot_password/otp_input.dart';
import '../../../components/auth/forgot_password/build_timer.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final VerificationController controller = Get.put(VerificationController());
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
                OtpInput(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
