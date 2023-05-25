import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_details_controller.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/data/models/products.dart';
import 'package:hamour/views/components/home_screen/appbar_product_details.dart';
import 'package:hamour/views/components/home_screen/products_details/product_detail_images.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.put(ProductDetailsController());

    Products product = controller.product;
    Size size = MediaQuery.of(context).size;
    // TextTheme textTheme = Theme.of(context).textTheme;
    Get.lazyPut<RepositryController>(() => RepositryController());
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
                  GetBuilder<ProductDetailsController>(
                    builder: (controller) {
                      // print('weeee' +
                      //     controller.repositryController.onStore[product.id]);
                      if (controller.repositryController.onStore[product.id] ==
                          1) {
                        return DataRequestHandler(
                          statusRequest: controller.statusRequest,
                          widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("addToCart".tr),
                              Card(
                                clipBehavior: Clip.antiAlias,
                                shape: ContinuousRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                // color: Theme.of(context).colorScheme.secondary,
                                /** */
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.addToCart();
                                        },
                                        icon: const Icon(Icons.add)),
                                    Text(
                                        "${controller.cartController.cartProductQuantity}"),
                                    IconButton(
                                        onPressed: () {
                                          controller.removeFromCart();
                                        },
                                        icon: const Icon(Icons.remove)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  )
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
