import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> exitAppAlert() {
  Get.defaultDialog(
      title: 'exit'.tr,
      middleText: "exitText",
      confirm: ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text('confirm'.tr),
      ),
      cancel: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text('cancel'.tr),
      ));
  return Future.value(true);
}
