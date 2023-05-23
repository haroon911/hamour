import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/views/components/size_configuration.dart';
import '../../../../controllers/home/home_controller.dart';

class CategoriesList extends GetView<HomeController> {
  const CategoriesList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.getProperateHight(140),
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (BuildContext context, int index) {
          return controller.categories[index].level == 1
              ? GestureDetector(
                  onTap: () {
                    controller.gotoProducts(
                        controller.categories, controller.categories[index].id);
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
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiLinks.categoryImages}/${controller.categories[index].image}",
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      FittedBox(
                        child: SizedBox(
                          width: 80,
                          child: Text(
                            translateDb(
                                arColumn: controller.categories[index].name,
                                enColumn: controller.categories[index].nameEn),
                            style: Theme.of(context).textTheme.labelLarge,
                            softWrap: true,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
