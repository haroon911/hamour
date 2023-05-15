import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/add_to_repo_dialog.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/models/categories.dart';
import 'package:hamour/data/models/products.dart';
import 'package:hamour/data/source/remote/home/products_data.dart';

class ProductCatController extends GetxController {
  // late int selectedCatIndex;
  late int catId;
  List<Categories> categories = [];
  List<Categories> subCategories = [];
  List<Categories> categoryStack = [];
  List<Products> products = [];
  final _isVisible = true.obs;
  final _hideButtonController = ScrollController();

  @override
  onInit() {
    initialData();
    super.onInit();

    _hideButtonController.addListener(() {
      _isVisible.value = _hideButtonController.position.userScrollDirection ==
              ScrollDirection.reverse
          ? true
          : false;
    });
  }

  bool get isVisible => _isVisible.value;
  ScrollController get hideButtonController => _hideButtonController;

  initialData() {
    if (categoryStack.isEmpty) {
      // selectedCatIndex = Get.arguments["selectedCatIndex"];
      categories = Get.arguments["categories"];
      catId = Get.arguments["catId"];
      subCategories
          .add(categories.firstWhere((category) => category.id == catId));
      getChildCategories(catId);
    } else {
      getChildCategories(categoryStack.last.id);
    }
    // if (products.isEmpty) {
    //   getProducts(catId);
    // }
  }

  onAddRepoPressed() {
    addToRepo();
  }

  getChildCategories(int categoryId) {
    subCategories = categories
        .where((category) => category.parentId == categoryId)
        .toList();
    getProducts(categoryId);
    update();
  }

  late StatusRequest statusRequest;
  ProductsData productsData = ProductsData(Get.find());
  HamourServices hamourServices = Get.find();
  getProducts(categoryId) async {
    products.clear();
    statusRequest = StatusRequest.loading;
    dynamic response;
    hamourServices.sharedPrefrences.getString("role_id") == "1"
        ? response = await productsData.getAllData(
            categoryId: categoryId.toString(),
            storeId: hamourServices.sharedPrefrences.getString("store_id"))
        : response =
            await productsData.getAllData(categoryId: categoryId.toString());
    statusRequest = dataHandler(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        response['products']
            .forEach((value) => products.add(Products.fromJson(value)));
        debugPrint("+-+-+-+-+--+-- ${response['status']}");
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
