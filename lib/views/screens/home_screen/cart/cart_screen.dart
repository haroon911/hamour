import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/cart_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/views/components/home_screen/cart/bottom_cart_bar.dart';
import 'package:hamour/views/components/home_screen/cart/cart_card.dart';

import '../../../components/home_screen/cart/top_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    // TotalCart totalCart = TotalCart(totalPrice: 0, totalQuantity: 0);
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        children: [
          TopBar(
            title: "cart",
            icon: Icons.location_on_rounded,
            leftIconString: "chooseLocation",
            onPressed: () {
              Get.toNamed(AppRoutes.addressScreen);
            },
          ),
          GetBuilder<CartController>(
            builder: (controller) {
              return DataRequestHandler(
                  statusRequest: controller.statusRequest,
                  widget: SizedBox(
                    height: MediaQuery.of(context).size.height - 230,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.cartProducts.length,
                      itemBuilder: (context, index) => CartCard(
                        index: index,
                      ),
                    ),
                  ));
            },
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (controller) => BottomCartBar(totalCart: controller.totalCart),
      ),
    );
  }
}

// bottomNavigationBar: Obx(
      //   () {
      //     return BottomBar(
      //       priceLabel: "Total price",
      //       priceValue: "\${controller.totalPrice.value.toStringAsFixed(2)}",
      //       buttonLabel: "Checkout",
      //       // onTap: controller.totalPrice > 0 ? () {} : null,
      //     );
      //   },
      // ),

