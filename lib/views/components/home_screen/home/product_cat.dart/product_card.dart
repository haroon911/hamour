import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/functions/add_to_repo_dialog.dart';
import 'package:hamour/data/models/only_products.dart';
import 'package:hamour/data/models/products_view.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

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
            CachedNetworkImage(
              imageUrl: "${ApiLinks.productImages}/${product.images.first}",
              // height: 200,
              // width: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
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
                      IconButton(
                        onPressed: addToRepo(),
                        icon: Icon(
                          // size: 30,
                          Icons.add_business_rounded,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
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
