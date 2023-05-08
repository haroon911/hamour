import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/views/components/home/category_list.dart';
import 'package:hamour/views/components/home/appbar_hamour.dart';
import 'package:hamour/views/components/home/product_home.dart';
import 'package:hamour/views/components/home/section_title.dart';
import 'package:hamour/views/components/home/slider.dart';

import '../../../core/classes/data_view_hander.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
    Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (controller) => DataRequestHandler(
        post: true,
        statusRequest: controller.statusRequest,
        widget: SingleChildScrollView(
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
