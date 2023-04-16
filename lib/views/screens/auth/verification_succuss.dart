import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/functions/auth_app_bar.dart';
import '../../../controllers/auth/verification_success_controller.dart';
import '../../components/auth/Widgets/auth_button.dart';
import '../../components/auth/Widgets/auth_intro.dart';

class VerificationSuccess extends StatelessWidget {
  VerificationSuccess({super.key});
  final VerificationSuccessController controller =
      Get.put(VerificationSuccessController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: Get.height - 100,
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(26.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline_rounded,
                    size: 200, color: Theme.of(context).primaryColor),
                const AuthIntroduction(
                    title: 'wellDone', subTitle: 'wellDoneText'),
                const Spacer(),
                AuthButton(
                    title: 'login',
                    onPressed: () {
                      controller.goToLogin();
                    }),
                // SizedBox(height: SizeConfig.getProperateHight(20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
