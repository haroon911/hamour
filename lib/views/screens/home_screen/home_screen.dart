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
              bottomNavigationBar: const BottomNavBar(),
            ));
  }
}
