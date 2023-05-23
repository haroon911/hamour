import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/drawer_functions.dart';
import 'package:hamour/data/models/dashBoard/menu_modal.dart';

import '../../core/functions/change_lang_dialog.dart';

class HamourDrawerController extends GetxController {
  int menuIndex = 0;

  List<MenuModel> menu = [
    MenuModel(
        icon: Icons.warehouse_outlined,
        title: "repositry",
        onTap: () {
          Get.toNamed(AppRoutes.repositryScreen);
        }),
    MenuModel(
        icon: Icons.notifications_none_rounded,
        title: "notifications",
        onTap: () {}),
    MenuModel(icon: Icons.history_rounded, title: "history", onTap: () {}),
    MenuModel(
        icon: Icons.nightlight_round,
        title: "switchMode",
        onTap: () {
          changeTheme();
        }),
    MenuModel(
        icon: Icons.language_rounded,
        title: "language",
        onTap: () {
          changeLanguage();
        }),
    MenuModel(
        icon: Icons.logout_rounded,
        title: "signout",
        onTap: () {
          signout();
        }),
  ];

  onMenuChange(index) {
    menuIndex = index;
    update();
  }

  sigout() {
    hamourServices.sharedPrefrences.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
