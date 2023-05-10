import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/data/models/dashBoard/menu_modal.dart';

class HamourDrawerController extends GetxController {
  int menuIndex = 0;
   List<MenuModel> menu = [
      MenuModel(icon: Icons.abc, title: "Dashboard"),
      MenuModel(icon: Icons.abc, title: "Profile"),
      MenuModel(icon: Icons.abc, title: "Exercise"),
      MenuModel(icon: Icons.abc, title: "Settings"),
      MenuModel(icon: Icons.abc, title: "History"),
      MenuModel(icon: Icons.abc, title: "Signout"),
    ];

  onMenuChange(index) {
    menuIndex = index;
    update();
  }
}
