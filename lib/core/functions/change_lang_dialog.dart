import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../localization/change_local.dart';

changeLanguage() {
  LocalController controller = Get.find<LocalController>();
  return Get.defaultDialog(
    title: 'choose language'.tr,
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text('العربية'),
          onPressed: () {
            controller.changeLanguage('ar');
            Get.back();
          },
          
        ),
        ElevatedButton(
          child: const Text('English'),
          onPressed: () {
            controller.changeLanguage('en');
            Get.back();
          },
          
        ),
      ],
    ),
  );
}
