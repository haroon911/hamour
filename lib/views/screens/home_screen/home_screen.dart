import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';

import '../../../controllers/home/home_screen_controller.dart';
import '../../components/home_screen/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Scaffold(
              body: controller.pages.elementAt(controller.currentPage),
              floatingActionButton: Obx(
                () => Visibility(
                  visible: controller.isVisible,
                  maintainAnimation: true,
                  maintainState: true,
                  child: AnimatedOpacity(
                    opacity: controller.isVisible ? 1 : 0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 500),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FloatingActionButton(
                          heroTag: "repoHero",
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.repositryScreen);
                          },
                          tooltip: "explore your products".tr,
                          child: const Icon(
                            // FontAwesomeIcons.warehouse,
                            Icons.warehouse_rounded,
                            size: 30,
                          ),
                        ),
                        Text(
                          "repositry".tr,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Obx(() => Visibility(
                  visible: controller.isVisible,
                  maintainAnimation: true,
                  maintainState: true,
                  child: AnimatedOpacity(
                      opacity: controller.isVisible ? 1 : 0,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 1000),
                      child: const BottomNavBar()))),
            ));
  }
}
