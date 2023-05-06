import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hamour/views/components/home/button_navigator.dart';

import '../../../controllers/home/home_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return GetBuilder<HomeScreenController>(
        builder: (controller) => Scaffold(
              body: controller.pages.elementAt(controller.currentPage),
              floatingActionButton: FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {},
                child: const Icon(
                  FontAwesomeIcons.cartShopping,
                  size: 30,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomAppBar(
                clipBehavior: Clip.antiAlias,
                shape: const CircularNotchedRectangle(),
                // shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: Row(
                  children: [
                    Row(
                      children: [
                        ButtonNavigator(
                            title: "dashBoard",
                            icon: FontAwesomeIcons.person,
                            onPressed: () {
                              controller.goToPage(0);
                            }),
                        ButtonNavigator(
                            title: "myProducts",
                            icon: FontAwesomeIcons.productHunt,
                            onPressed: () {
                              controller.goToPage(1);
                            }),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        ButtonNavigator(
                            title: "home",
                            icon: Icons.home_rounded,
                            onPressed: () {
                              controller.goToPage(2);
                            }),
                        ButtonNavigator(
                            title: "categories",
                            icon: Icons.category_rounded,
                            onPressed: () {
                              controller.goToPage(3);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ));
  }
}
