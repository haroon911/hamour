import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../../data/source/static/static.dart';

Widget buildIndicator(BuildContext context) {
  //this find our onBoarding controller 
  final controller = Get.find<OnBoardingController>();
  //for the dots in bottom that move from point to another
  return SmoothPageIndicator(
    controller: controller.pageController,
    count: onBoardingList.length,
    effect: JumpingDotEffect(
      activeDotColor: Theme.of(context).appBarTheme.backgroundColor!,
    ),
    onDotClicked: (index) => controller.pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn),
  );
}
