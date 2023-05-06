import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/api_links.dart';

import '../../../controllers/home/home_controller.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return SizedBox(
      height: 120,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              SizedBox(
                height: 90,
                width: 90,
                child: Card(
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    "${ApiLinks.categoryImages}/${controller.categories[index].image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                controller.categories[index].name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          );
        },
      ),
    );
  }
}
