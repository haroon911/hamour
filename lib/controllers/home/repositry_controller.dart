import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/models/products.dart';
import 'package:hamour/data/models/repositry_products.dart';
import 'package:hamour/data/source/remote/home/repositry_data.dart';

class RepositryController extends GetxController {
  //Key -> product_id :: value -> bolean 0 or 1

  Map onStore = {};

  setToStore(id, value) {
    onStore[id] = value;
    //onStore[id] = !value;
    update();
  }

  late StatusRequest statusRequest;
  RepositryData repositryData = RepositryData(Get.find());
  HamourServices hamourServices = Get.find();

  addOnStore({required String productId}) async {
    statusRequest = StatusRequest.loading;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      var response = await repositryData.addProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      statusRequest = dataHandler(response);
      debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          // Get.rawSnackbar(title: "appName".tr, messageText: Text("added".tr));
          // Get.snackbar('appName'.tr, 'added'.tr,
          //     snackPosition: SnackPosition.BOTTOM,
          //     duration: Duration(milliseconds: 500));
        } else {
          statusRequest = StatusRequest.failure;
        }
      } else {
        // statusRequest = StatusRequest.serverFailure;
      }
      // update();
    }
  }

  removeFromStore({required String productId}) async {
    // statusRequest = StatusRequest.loading;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      var response = await repositryData.removeProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
        productId: productId,
      );
      if (repositryProducts.isNotEmpty) {
        repositryProducts
            .removeWhere((element) => element.id.toString() == productId);
        update();
      }

      statusRequest = dataHandler(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          // Get.rawSnackbar(title: "appName".tr, messageText: Text("removed".tr));
          // Get.snackbar('appName'.tr, 'removed'.tr,
          //     snackPosition: SnackPosition.BOTTOM);
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      // update();
    }
  }

  // List<RepositryProducts> repositryProducts = [];
  List<Products> repositryProducts = [];
  viewProducts() async {
    statusRequest = StatusRequest.loading;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      var response = await repositryData.viewProduct(
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
      );
      statusRequest = dataHandler(response);
      debugPrint("+++++++++++ $statusRequest");
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == "success") {
          List responseProducts = response['products'];
          repositryProducts
              .addAll(responseProducts.map((e) => Products.fromJson(e)));
          // debugPrint(repositryProducts[0].onStore.toString());
          // responseProducts.map((e) => RepositryProducts.fromJson(e)));
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
  void onInit() {
    viewProducts();
    super.onInit();
  }
}
