import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_cat_controller.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/views/components/home_screen/home/product_cat/categories_view.dart';
import 'package:hamour/views/components/home_screen/home/product_cat/product_card.dart';
import 'package:hamour/views/components/home_screen/surfing_appbar.dart';

class ProductCatScreen extends StatelessWidget {
  const ProductCatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RepositryController controllerRepo = Get.put(RepositryController());
    final ProductCatController controller = Get.put(ProductCatController());
    Future<bool> returning() {
      Get.close(0);
      if (controller.categoryStack.isNotEmpty) {
        controller.categoryStack.removeLast();
        // controller.getProducts(controller.categoryStack.last.id);
        controller.initialData();
      }
      return Future.value(true);
    }

    return WillPopScope(
      onWillPop: returning,
      child: Scaffold(
        body: SingleChildScrollView(
          // controller: controller.hideButtonController,
          child: Column(
            children: [
              SurfingAppBar(
                onBackPressed: () {
                  Get.close(0);
                  if (controller.categoryStack.isNotEmpty) {
                    controller.categoryStack.removeLast();
                    controller.initialData();
                  }
                },
              ),
              controller.subCategories.isNotEmpty
                  ? const CategoriesView()
                  : const SizedBox(),
              GetBuilder<ProductCatController>(
                builder: (controller) => DataRequestHandler(
                  statusRequest: controller.statusRequest,
                  widget: MasonryGridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.products.length,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    // crossAxisSpacing: 8,
                    itemBuilder: (context, index) {
                      controllerRepo.onStore[controller.products[index].id] =
                          controller.products[index].onStore;
                      return ProductCard(
                        product: controller.products[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
              Get.toNamed(AppRoutes.repositryScreen);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.warehouse_rounded),
        ),
      ),
    );
  }
}
