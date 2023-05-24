import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/translate_database.dart';

class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key});
  // final Product product;
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    var size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      constraints: BoxConstraints(maxWidth: size.width, maxHeight: 300),
      child: ListView.builder(
        itemCount: controller.products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () {
                debugPrint(controller.products[index].onStore.toString());
                Get.toNamed(AppRoutes.productDetails, arguments: {
                  "product": controller.products[index],
                });
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                // padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CachedNetworkImage(
                  imageUrl:
                      "${ApiLinks.productImages}/${controller.products[index].images.first}",
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  fit: BoxFit.cover,
                  width: 250,
                  height: 200,
                ),
              ),
            ),
            SizedBox(
              width: 220,
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      translateDb(
                          arColumn: controller.products[index].name,
                          enColumn: controller.products[index].nameEn),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    '${controller.products[index].price} ${"riyal".tr}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Text(
                        '${(controller.products[index].price - (controller.products[index].discount * controller.products[index].price)).ceil()}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.green),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'riyal'.tr,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
