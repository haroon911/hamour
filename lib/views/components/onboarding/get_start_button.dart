import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/onboarding/onboarding_controller.dart';

class GetStartButton extends GetView<OnBoardingController> {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).appBarTheme.backgroundColor),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(80))),
      onPressed: () {
        // Get.offAllNamed(AppRoute.login);
        controller.goToLogin();
      },
      child: Text(
        'Get Started'.tr,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
