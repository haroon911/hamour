import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_cat_controller.dart';
import 'package:hamour/core/constants/api_links.dart';

class CategoriesView extends GetView<ProductCatController> {
  const CategoriesView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.restCategories.length,
        itemBuilder: (BuildContext context, int index) {
          return (controller.restCategories[index].level ==
                      controller.newLevel) &&
                  (controller.restCategories[index].parentId ==
                      controller.restCategories[controller.selectedCatIndex].id)
              ? GestureDetector(
                  onTap: () {
                    controller.gotoProducts(
                      controller.restCategories,
                      index,
                    );
                  },
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Card(
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            "${ApiLinks.categoryImages}/${controller.restCategories[index].image}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Text(
                        controller.restCategories[index].name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                );
        },
      ),
    );
  }
}
