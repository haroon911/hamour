
import 'package:flutter/widgets.dart';

class OnBoardingModel {
  final String title;
  final String imageUrl;
  final String body;
  final Color color;
  final IconData icon;
  OnBoardingModel(
      {required this.title,
      required this.imageUrl,
      required this.body,
      required this.color,
      required this.icon,
      });
}

class OnBoardingData {
  final List<OnBoardingData> onBoardingData;

  OnBoardingData({required this.onBoardingData});
}
