import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../../data/models/onboarding_model.dart';
import '../../../data/source/static/static.dart';

class ContentSlider extends StatelessWidget {
  const ContentSlider({super.key, required this.controller});
  final OnBoardingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 80),
      child: PageView.builder(
          onPageChanged: (index) => controller.onPageControllerChanged(index),
          controller: controller.pageController,
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            OnBoardingModel data = onBoardingList[index];
            return Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(data.icon, size: 250),
                  const SizedBox(height: 14),
                  Text(data.title.tr,
                      style: Theme.of(context).textTheme.displayLarge,
                      textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Text(data.body.tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(height: 1.5),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center),
                ],
              ),
            );
          }),
    );
  }
}
