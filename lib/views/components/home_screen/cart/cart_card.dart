import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/cart_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/core/functions/translate_database.dart';
import 'package:hamour/views/components/home_screen/cart/money_tile.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
    this.onTap,
    // required this.product,
    this.onDismissed,
    required this.index,
  });
  final void Function()? onTap;
  final void Function(DismissDirection)? onDismissed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return Dismissible(
          key: const ValueKey<String>("product.id.toString()"),
          secondaryBackground: Container(
            color: Colors.red.shade400,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.delete_forever,
              size: 40,
              color: Colors.white,
            ),
          ),
          background: Container(
            color: Colors.orange.shade200,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.edit, size: 40),
          ),
          direction: DismissDirection.endToStart,
          onDismissed: onDismissed,
          child: SizedBox(
            // height: 100,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onTap,
                // onTap: () {},
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${ApiLinks.productImages}/${cartController.cartProducts[index].images.first}",
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                        )),
                    Expanded(
                        flex: 3,
                        child: ListTile(
                          title: Text(
                            translateDb(
                                arColumn:
                                    cartController.cartProducts[index].name,
                                enColumn:
                                    cartController.cartProducts[index].nameEn),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    cartController.add(
                                        productId: cartController
                                            .cartProducts[index].id
                                            .toString(),
                                        stock: cartController
                                            .cartProducts[index].stock);
                                  },
                                  icon: const Icon(Icons.add)),
                              Text(cartController
                                  .cartProducts[index].cartQuantity
                                  .toString()),
                              IconButton(
                                  onPressed: () {
                                    cartController.remove(
                                      productId: cartController
                                          .cartProducts[index].id
                                          .toString(),
                                    );
                                  },
                                  icon: const Icon(Icons.remove)),
                            ],
                          ),
                          trailing: MoneyTile(
                              price: cartController
                                  .cartProducts[index].aggregatePrice
                                  .toDouble()),
                        )),
                  ],
                ),
              ),
            ),
          ));
    });
  }
}
