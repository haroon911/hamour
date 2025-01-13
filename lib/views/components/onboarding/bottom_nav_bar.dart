import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../../data/source/static/static.dart';
import 'indecator.dart';
import 'nav_button.dart';



class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});
  final OnBoardingController controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NavigationButton(
            title: 'skip',
            onPressed: () => controller.pageController
                .jumpToPage(onBoardingList.indexOf(onBoardingList.last)),
          ),
          Center(
            child: buildIndicator(context),
          ),
          NavigationButton(
            title: 'next',
            onPressed: () => controller.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            ),
          )
        ],
      ),
    );
  }
}
