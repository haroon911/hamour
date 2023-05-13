import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
              floatingActionButton: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    onPressed: () {},
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
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const BottomNavBar(),
            ));
  }
}
