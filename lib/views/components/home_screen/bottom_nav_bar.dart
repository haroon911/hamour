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
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(Icons.menu_rounded),
                    label: "dashboard".tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.category_rounded), label: "categories".tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.store_mall_directory_rounded),
                    label: "home".tr),
                BottomNavigationBarItem(
                    icon:const  Icon(Icons.warehouse_rounded), label: "reposetry".tr),
              ],
            ));
  }
}
