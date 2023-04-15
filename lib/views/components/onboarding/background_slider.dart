
import 'package:flutter/material.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../../data/source/static/static.dart';

class BackgroundSlider extends StatelessWidget {
  const BackgroundSlider({super.key, required this.controller});

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.backgroundController,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            scale: 0.55,
            image: AssetImage(
              onBoardingList[index].imageUrl,
            ),
          ),
          shape: BoxShape.circle,
          // color: onBoardingList[index].color,
          // gradient: LinearGradient(colors: [
          //   onBoardingList[index].color,
          //   onBoardingList[index].color,
          //   // onBoardingList[index].color.withGreen(index * 7 % 255),
          //   // Color.fromARGB(255, 19, 40, 228)
          // ]),
        ),
      ),
    );
  }
}
