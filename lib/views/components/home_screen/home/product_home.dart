import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:hamour/core/constants/api_links.dart';

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
            Card(
              clipBehavior: Clip.antiAlias,
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Image.network(
                "${ApiLinks.productImages}/${controller.products[index].images.first}",
                fit: BoxFit.cover,
                width: 250,
                height: 200,
              ),
            ),
            SizedBox(
              width: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(controller.products[index].name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(
                    '${controller.products[index].price} ريال',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  Row(
                    children: [
                      Text(
                        '${(controller.products[index].price * controller.products[index].discount).round()}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            decoration: TextDecoration.underline,
                            color: Colors.green),
                      ),
                      Text(
                        'Riyal'.tr,
                        maxLines: 2,
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
