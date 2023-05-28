import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/data/models/cart_products.dart';

import 'money_tile.dart';

class BottomCartBar extends StatelessWidget {
  const BottomCartBar({
    super.key,
    required this.totalCart,
  });
  final TotalCart totalCart;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        height: 140,
        notchMargin: 20,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("totalPrice".tr,
                style: Theme.of(context).textTheme.displaySmall),
            MoneyTile(price: totalCart.totalPrice.toDouble()),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.addressScreen);
                },
                // onPressed:controller.totalPrice > 0 ? () {} : null,
                style: ButtonStyle(
                  surfaceTintColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.primary),
                  textStyle: MaterialStatePropertyAll(Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: Colors.black)),
                  shape: MaterialStatePropertyAll(
                    ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  // onTap: controller.totalPrice > 0 ? () {} : null,
                  // height: 60,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text("check".tr),
                ))
          ],
        ));
  }
}
