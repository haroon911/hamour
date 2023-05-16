import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/data/models/products.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.active = false,
  });
  final bool active;
  final Products product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.productDetails,
                    arguments: {"product": product});
              },
              child: Hero(
                tag:
                    "image${product.id}no${product.images.indexOf(product.images.first)}",
                child: CachedNetworkImage(
                  imageUrl: "${ApiLinks.productImages}/${product.images.first}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    translateDb(
                        arColumn: product.name, enColumn: product.nameEn),
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text("rate".tr,
                          style: Theme.of(context).textTheme.labelLarge!),
                      const SizedBox(width: 5),
                      Text(
                        "3.4",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          Icon(
                            // size: 30,
                            Icons.star_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                          Icon(
                            // size: 30,
                            Icons.star_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                          Icon(
                            // size: 30,
                            Icons.star_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                          Icon(
                            // size: 30,
                            Icons.star_half_rounded,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("price".tr,
                          style: Theme.of(context).textTheme.labelLarge!),
                      const SizedBox(width: 5),
                      Text(
                        product.price.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.green),
                      ),
                      const Spacer(),
                      GetBuilder<RepositryController>(builder: (controller) {
                        return IconButton(
                          onPressed: () {
                            controller.onStore[product.id] == 1
                                ? Get.defaultDialog(
                                    title: 'remove'.tr,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          child: Text('remove'.tr),
                                          onPressed: () {
                                            controller.setToStore(
                                                product.id, 0);
                                            controller.removeFromStore(
                                                productId:
                                                    product.id.toString());
                                            Get.back();
                                          },
                                          onLongPress: () {
                                            Get.back();
                                          },
                                        ),
                                        ElevatedButton(
                                          child: Text('cancel'.tr),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : Get.defaultDialog(
                                    title: 'addToRepo'.tr,
                                    content: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          child: const Text('add'),
                                          onPressed: () {
                                            controller.setToStore(
                                                product.id, 1);
                                            controller.addOnStore(
                                                productId:
                                                    product.id.toString());
                                            Get.back();
                                          },
                                          onLongPress: () {
                                            Get.back();
                                          },
                                        ),
                                        ElevatedButton(
                                          child: Text('cancel'.tr),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                          },
                          icon: Icon(
                            controller.onStore[product.id] == 1
                                ? Icons.library_add_check_rounded
                                : Icons.add_business_outlined,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        );
                      }),
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
