import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../../controllers/auth/login_controller.dart';

class RememberForgotRow extends StatelessWidget {
  const RememberForgotRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GetBuilder<LoginController>(builder: (controller) {
        return Row(
          children: [
            CheckboxMenuButton(
              style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.transparent)),
              value: controller.remember,
              onChanged: (value) => controller.changeCheck(value),
              child: Text('remember me'.tr),
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                controller.goToForgetPassword();
              },
              overlayColor: MaterialStateColor.resolveWith(
                  (states) => Colors.transparent),
              child: Text(
                'forgotPassword'.tr,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          ],
        );
      }),
    );
  }
}
