import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/controllers/home/home_screen_controller.dart';
import 'package:hamour/views/components/home_screen/home/category_list.dart';
import 'package:hamour/views/components/home_screen/appbar_hamour.dart';
import 'package:hamour/views/components/home_screen/home/product_home.dart';
import 'package:hamour/views/components/home_screen/section_title.dart';
import 'package:hamour/views/components/home_screen/home/slider.dart';

import '../../../../core/classes/data_view_hander.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    Get.put(HomeController());
    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return GetBuilder<HomeController>(
      builder: (controller) => DataRequestHandler(
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
          controller: homeScreenController.hideButtonController,
          child: Column(
            children: [
              const HomeAppBar(),
              const SizedBox(height: 10),
              const HamourCarouselSlider(),
              const SizedBox(height: 10),
              SectionTitle(title: "categories", onTap: () {}),
              const CategoriesList(),
              SectionTitle(title: "categories", onTap: () {}),
              const ProductThumbnail(),
              SectionTitle(title: "categories", onTap: () {}),
              const ProductThumbnail(),
              SectionTitle(title: "categories", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
