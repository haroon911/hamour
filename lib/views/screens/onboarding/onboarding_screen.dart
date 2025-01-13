import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../components/onboarding/export_onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final OnBoardingController controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            BackgroundSlider(controller: controller),
            const BlureFilter(),
            ContentSlider(controller: controller),
          ],
        ),
        //checks if we are in the last page so we can apear the Get started button
        bottomSheet: GetBuilder<OnBoardingController>(
          builder: (controller) {
            return controller.lastPage
                ? const GetStartButton()
                : BottomNavBar();
          },
        ),
      );
}

class BlureFilter extends StatelessWidget {
  const BlureFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        // blendMode: BlendMode.darken,
        filter: ImageFilter.blur(sigmaX: 70, sigmaY: 70),
        child: const SizedBox(height: 100, width: 100));
  }
  // BackdropFilter(
  //   // blendMode: BlendMode.darken,
  //   filter: ImageFilter.blur(sigmaX: 50, sigmaY: 30),
  //   child: const SizedBox(
  //     height: 200,
  //     width: 200,
  //   ),
  // ),
}
