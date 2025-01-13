import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/drawer_controller.dart';

import '../services/services.dart';

HamourServices hamourServices = Get.find();

changeTheme() {
     if (hamourServices.sharedPrefrences.getBool('isDarkMode') == null) {
          hamourServices.sharedPrefrences.setBool("isDarkMode", Get.isDarkMode);
        }
    

  if (hamourServices.sharedPrefrences.getBool("isDarkMode")!) {
    Get.changeThemeMode(ThemeMode.light);
    hamourServices.sharedPrefrences.setBool("isDarkMode", false);
    return false;
  } else {
    Get.changeThemeMode(ThemeMode.dark);
    hamourServices.sharedPrefrences.setBool("isDarkMode", true);
  }
  
}

signout() {
  HamourDrawerController controller = Get.find<HamourDrawerController>();

  return Get.defaultDialog(
    title: 'signout'.tr,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text('signout'.tr),
          onPressed: () {
            controller.sigout();
          },
          onLongPress: () {
            Get.back();
          },
        ),
        ElevatedButton(
          child: Text('cancel'.tr),
          onPressed: () {
            Get.back();
          },
        ),
      ],
    ),
  );
}
