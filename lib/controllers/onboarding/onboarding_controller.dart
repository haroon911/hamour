import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

import '../../core/constants/route_names.dart';
import '../../core/functions/change_lang_dialog.dart';
import '../../data/source/static/static.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();

  final backgroundController = PageController();

  int currentPage = 0;
  bool lastPage = false;

  HamourServices hamourServices = Get.find();

  // next() {}
  goToLogin() {
    hamourServices.sharedPrefrences.setString("step", "1");
    Get.offAllNamed(AppRoute.login);
  }

  onPageControllerChanged(int index) {
    currentPage = index;
    backgroundController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.decelerate);
    //checking if we are in the last index
    lastPage = index == onBoardingList.length - 1;
    update();
  }

  @override
  void onReady() {
    changeLanguage();

    super.onReady();
  }

  changeLang() {}
}
