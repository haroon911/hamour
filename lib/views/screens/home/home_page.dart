import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/views/components/home/category_list.dart';
import 'package:hamour/views/components/home/appbar_hamour.dart';
import 'package:hamour/views/screens/home/product_home.dart';
import '../../../core/classes/data_view_hander.dart';
import '../../components/home/section_title.dart';
import '../../components/home/slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Get.put(HomeController());

    return Scaffold(
      drawer: const Drawer(),
      appBar: hamourAppBar(size, colorScheme),
      body: GetBuilder<HomeController>(
        builder: (controller) => DataRequestHandler(
          post: true,
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              const SizedBox(height: 5),
              const HamourCarouselSlider(),
              SectionTitle(title: "categories", onTap: () {}),
              // const SizedBox(height: 5),
              const CategoriesList(),
              SectionTitle(title: "categories", onTap: () {}),
              const ProductThumbnail(),
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
