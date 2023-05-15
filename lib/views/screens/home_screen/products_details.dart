import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_details_controller.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/views/components/home_screen/appbar_product_details.dart';
import 'package:hamour/views/components/home_screen/products_details/product_detail_images.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  
  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());
    Size size = MediaQuery.of(context).size;
    // TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarProductDetails(
        rating: 3.5,
        preferredSize: Size.fromHeight(
          AppBar().preferredSize.height,
        ),
        child: const SizedBox(),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          child: Column(
            children: [
              const ProductDetailImages(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text("price".tr),
                        const SizedBox(width: 10),
                        Text(
                          controller.product.price.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Card(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            translateDb(
                                arColumn: controller.product.name,
                                enColumn: controller.product.nameEn),
                            style: Theme.of(context).textTheme.displaySmall,
                          ))),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text("stock".tr),
                        const SizedBox(width: 10),
                        Text(
                          controller.product.stock.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  ),
                  const DetailsCard(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductDetailsController controller = Get.find();
    return Card(
        child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "details".tr,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    translateDb(
                        arColumn: controller.product.details,
                        enColumn: controller.product.detailsEn),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
              ],
            )));
  }
}
