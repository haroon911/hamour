import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_cat_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/translate_database.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ProductCatController(),
      builder: (controller) => SizedBox(
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: MasonryGridView.builder(
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1),
            scrollDirection: Axis.horizontal,
            itemCount: controller.subCategories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.productsScreen,
                      preventDuplicates: false);
                  controller.categoryStack.add(controller.subCategories[index]);
                  controller
                      .getChildCategories(controller.categoryStack.last.id);
                  // controller.getProducts(controller.categoryStack.last.id);
                  // print(controller.subCategories.first);
                },
                child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  clipBehavior: Clip.antiAlias,
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.categoryImages}/${controller.subCategories[index].image}",
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          translateDb(
                              arColumn: controller.subCategories[index].name,
                              enColumn: controller.subCategories[index].nameEn),
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
    );
  }
}
