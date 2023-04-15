import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar myAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'appName'.tr,
      style: Get.textTheme.displayLarge,
    ),
    // backgroundColor: Theme.of(context).colorScheme.background,
    backgroundColor: Get.theme.colorScheme.background,
    iconTheme:
        // IconThemeData(color: Theme.of(context).appBarTheme.backgroundColor),
        IconThemeData(color: Get.theme.appBarTheme.backgroundColor),
  );
}
