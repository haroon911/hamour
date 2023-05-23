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
                    icon: const Icon(Icons.dashboard_customize),
                    label: "dashboard".tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.store_mall_directory_rounded),
                    label: "home".tr),

                // BottomNavigationBarItem(
                //     icon: const Icon(Icons.category_rounded),
                //     label: "categories".tr),
                // BottomNavigationBarItem(
                //     icon: const Icon(Icons.warehouse_rounded),
                //     label: "reposetry".tr),
              ],
            ));
  }
}
/**
 * 

             BottomAppBar(
              surfaceTintColor: Colors.blue,
              padding: EdgeInsets.all(0),
              notchMargin: 40,
              clipBehavior: Clip.antiAlias,
              shape: CircularNotchedRectangle(),
              height: 60,
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    child: SizedBox(height: 60, child: Icon(Icons.home)),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    child: SizedBox(height: 60, child: Icon(Icons.home)),
                    onTap: () {},
                  )),
                  Expanded(
                      child: InkWell(
                    child: SizedBox(height: 60, child: Icon(Icons.dashboard)),
                    onTap: () {
                      Get.toNamed(AppRoutes.dashBoard);
                    },
                  )),
                ],
              ),
            )
 */