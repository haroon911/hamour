import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/home/cart_data.dart';

import '../../data/models/cart_products.dart';

class CartController extends GetxController {
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  HamourServices hamourServices = Get.find();
  int cartProductQuantity = 0;
  List<CartProducts> cartProducts = [];
  TotalCart totalCart = TotalCart(totalPrice: 0, totalQuantity: 0);
  add({required String productId, required int stock}) async {
    // statusRequest = StatusRequest.loading;
    if (cartProductQuantity < stock &&
        hamourServices.sharedPrefrences.getString('role_id') == "1") {
      cartProductQuantity += 1;
      var response = await cartData.addProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      // statusRequest = dataHandler(response);
      // debugPrint("+++++++++++ $statusRequest");
      // if (statusRequest == StatusRequest.success) {
      //   if (response['status'] == "success") {
      //     // Get.snackbar('appName'.tr, 'added'.tr,
      //     //     snackPosition: SnackPosition.TOP,
      //     //     duration: const Duration(milliseconds: 1500));
      //   } else {
      //
      //     statusRequest = StatusRequest.failure;
      //   }
      // } else {
      //   // statusRequest = StatusRequest.serverFailure;
      // }
    }
    update();
  }

  remove({required String productId}) async {
    // statusRequest = StatusRequest.loading;
    if (cartProducts.singleWhere((e) => "${e.id}"==productId).cartQuantity > 0 &&
        hamourServices.sharedPrefrences.getString('role_id') == "1") {
      cartProductQuantity -= 1;
      var response = await cartData.removeProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      // statusRequest = dataHandler(response);
      // debugPrint("+++++++++++ $statusRequest");
      // if (statusRequest == StatusRequest.success) {
      //   if (response['status'] == "success") {
      //     // Get.snackbar('appName'.tr, 'added'.tr,
      //     //     snackPosition: SnackPosition.TOP,
      //     //     duration: const Duration(milliseconds: 1500));
      //   } else {
      //     statusRequest = StatusRequest.failure;
      //   }
      // } else {
      //   // statusRequest = StatusRequest.serverFailure;
      // }
      update();
    }
  }

  getProductQuantity({required String productId}) async {
    statusRequest = StatusRequest.loading;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      var response = await cartData.getProductQuantity(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      statusRequest = dataHandler(response);
      debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          cartProductQuantity = response['data'];
          return cartProductQuantity;
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // statusRequest = StatusRequest.serverFailure;
      }
      update();
    }
  }

  viewCart() async {
    statusRequest = StatusRequest.loading;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      var response = await cartData.viewCart(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
      );
      statusRequest = dataHandler(response);
      debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          response['data'].forEach(
              (value) => cartProducts.add(CartProducts.fromJson(value)));
          totalCart = TotalCart.fromJson(response['total']);
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // statusRequest = StatusRequest.serverFailure;
      }
      update();
    }
  }

  @override
  void onInit() async {
    await viewCart();
    debugPrint("${totalCart.totalQuantity}");
    super.onInit();
  }
}
