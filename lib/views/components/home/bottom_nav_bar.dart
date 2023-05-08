import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_screen_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<HomeScreenController>();
    return GetBuilder<HomeScreenController>(
        builder: (controller) => BottomNavigationBar(
              onTap: (value) {
                controller.goToPage(value);
              },
              currentIndex: controller.currentPage,
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_rounded), label: "dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.category_rounded), label: "categories"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.store_mall_directory_rounded),
                    label: "home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.warehouse_rounded), label: "reposetry"),
              ],
            ));
  }
}
