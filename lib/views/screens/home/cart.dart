
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:hamour/views/components/home/cart/bottom_bar.dart';

// class CartScreen extends StatelessWidget {
//   const CartScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar:Obx(
//         () {
//           return BottomBar(
//             priceLabel: "Total price",
//             priceValue: "\$${controller.totalPrice.value.toStringAsFixed(2)}",
//             buttonLabel: "Checkout",
//             onTap: controller.totalPrice > 0 ? () {} : null,
//           );
//         },
//       ),
//     );
//   }
// }