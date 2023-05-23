import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/data/models/products.dart';

class RepoProductCard extends StatelessWidget {
  const RepoProductCard({
    super.key,
    required this.product,
    this.active = false,
    required this.controller,
  });
  final RepositryController controller;
  final bool active;
  // final RepositryProducts product;
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
            Stack(
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
                      imageUrl:
                          "${ApiLinks.productImages}/${product.images.first}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                RemoveBtn(
                  onPressed: () {
                    controller.setToStore(product.id, 0);
                    controller.removeFromStore(
                        productId: product.id.toString());
                    Get.close(0);
                  },
                ),
              ],
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
                      Card(
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_shopping_cart_rounded)),
                      )
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

class RemoveBtn extends StatelessWidget {
  const RemoveBtn({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Get.defaultDialog(
            title: 'remove'.tr,
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onPressed,
                  onLongPress: () {
                    Get.back();
                  },
                  child: Text('remove'.tr),
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
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            Icons.playlist_remove_rounded,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
