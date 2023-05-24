import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/controllers/home/home_screen_controller.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/controllers/home/search_controller.dart';
import 'package:hamour/views/components/home_screen/home/category_list.dart';
import 'package:hamour/views/components/home_screen/appbar_hamour.dart';
import 'package:hamour/views/components/home_screen/home/product_cat/product_card.dart';
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
    final RepositryController controllerRepo = Get.put(RepositryController());

    HomeScreenController homeScreenController = Get.put(HomeScreenController());
    return GetBuilder<HomeController>(
      builder: (controller) => DataRequestHandler(
        statusRequest: controller.statusRequest,
        widget: Scaffold(
          body: SingleChildScrollView(
              controller: homeScreenController.hideButtonController,
              child: Column(
                children: [
                  HomeAppBar(
                    searchController: controller.searchController,
                    onChanged: controller.onChanged,
                    onTapSearch: () {
                      controller.onSearch();
                    },
                  ),
                  const SizedBox(height: 10),
                  !controller.isSearching
                      ? Column(
                          children: [
                            const HamourCarouselSlider(),
                            const SizedBox(height: 10),
                            SectionTitle(title: "categories", onTap: () {}),
                            const CategoriesList(),
                            SectionTitle(title: "discounts", onTap: () {}),
                            const ProductThumbnail(),
                            SectionTitle(title: "categories", onTap: () {}),
                            const ProductThumbnail(),
                          ],
                        )
                      : MasonryGridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchProducts.length,
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          // crossAxisSpacing: 8,
                          itemBuilder: (context, index) {
                            controllerRepo.onStore[controller
                                .searchProducts[index]
                                .id] = controller.searchProducts[index].onStore;
                            return ProductCard(
                              product: controller.searchProducts[index],
                            );
                          },
                        ),
                ],
              )),
        ),
      ),
    );
  }
}
