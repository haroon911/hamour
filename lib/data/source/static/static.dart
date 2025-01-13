import 'package:flutter/material.dart';
import '../../../core/constants/image_assets.dart';
import '../../models/onboarding_model.dart';

//For onboarding
List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: 'onBoardingTitle1',
      body: 'onBoardingBody1',
      imageUrl: ImageAssets.onBoardingImages[0],
      color: Colors.deepPurple.shade200,
      icon: Icons.store),
  OnBoardingModel(
      title: 'onBoardingTitle2',
      body: 'onBoardingBody2',
      imageUrl: ImageAssets.onBoardingImages[1],
      color: Colors.deepOrange.shade200,
      icon: Icons.payments),
  OnBoardingModel(
      title: 'onBoardingTitle3',
      body: 'onBoardingBody3',
      imageUrl: ImageAssets.onBoardingImages[2],
      color: Colors.green.shade200,
      icon: Icons.delivery_dining),
  OnBoardingModel(
      title: 'onBoardingTitle4',
      body: 'onBoardingBody4',
      imageUrl: ImageAssets.onBoardingImages[3],
      color: const Color.fromARGB(255, 249, 144, 147),
      icon: Icons.shopping_cart),
];
