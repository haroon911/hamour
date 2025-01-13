import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/models/cart_products.dart';
import 'package:hamour/data/source/remote/home/cart_data.dart';

class CartController extends GetxController {
  //initializing data
  late StatusRequest statusRequest;
  CartData cartData = CartData(Get.find());
  HamourServices hamourServices = Get.find();
  int cartProductQuantity = 0;
  List<CartProducts> cartProducts = [];
  late TotalCart totalCart = TotalCart(totalPrice: 0, totalQuantity: 0);

  add({required String productId, required int stock}) async {
    // statusRequest = StatusRequest.loading;
    if (cartProductQuantity < stock &&
        hamourServices.sharedPrefrences.getString('role_id') == "1") {
      cartProductQuantity += 1;
      var response = await cartData.addProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          cartProducts.clear();
          viewCart();
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // statusRequest = StatusRequest.serverFailure;
      }
    }
    update();
  }

  remove({required String productId}) async {
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      cartProductQuantity -= 1;
      var response = await cartData.removeProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      statusRequest = dataHandler(response);
      // debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          cartProducts.clear();
          viewCart();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
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
      // debugPrint("+++++++++++ $statusRequest");
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
      // debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          totalCart = TotalCart.fromJson(response['total']);
          response['data'].forEach(
              (value) => cartProducts.add(CartProducts.fromJson(value)));
          // print("${cartProducts.first.cartQuantity}");
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    }
    update();
  }

  resetCart() {
    totalCart = TotalCart(totalPrice: 0, totalQuantity: 0);
    cartProducts.clear();
  }

  refreshPage() {
    resetCart();
    viewCart();
  }

  @override
  void onInit() async {
    await viewCart();
    super.onInit();
  }
}
