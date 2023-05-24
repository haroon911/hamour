import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/models/products.dart';
import 'package:hamour/data/source/remote/home/home_data.dart';
import 'package:hamour/data/source/remote/home/search_data.dart';

import '../../core/classes/status_request.dart';
import '../../core/functions/data_handler_controller.dart';
import '../../data/models/categories.dart';
import '../../data/models/offers.dart';

class HomeController extends GetxController {
  HamourServices hamourServices = Get.find();

  String? name;
  late int catId;

  //searching section
  SearchData searchData = SearchData(Get.find());
  List<Products> searchProducts = [];
  viewProducts(String item) async {
    print(item);
    var response;
    if (hamourServices.sharedPrefrences.getString('role_id') == "1") {
      response = await searchData.searchData(
        search: item,
        storeId: hamourServices.sharedPrefrences.getString("store_id")!,
      );
    } else {
      response = await searchData.searchData(search: item);
    }
    if (response['status'] == "success") {
      List responseProducts = response['products'];
      searchProducts.addAll(responseProducts.map((e) {
        return Products.fromJson(e);
      }));
    }

    update();
  }

  late bool isSearching;
  Color iconSearchColor = Color.fromARGB(255, 146, 146, 146);
  late TextEditingController searchController;
  onSearch() {
    searchProducts.clear();
    viewProducts(searchController.text);
    isSearching = true;
    update();
  }

  onChanged(value) {
    if (value == "") {
      isSearching = false;
      iconSearchColor = const Color.fromARGB(255, 146, 146, 146);
    } else {
      iconSearchColor = Get.theme.colorScheme.secondary;
    }
    update();
  }
  //end searching section

  String? id;
  @override
  void onInit() async {
    isSearching = false;
    searchController = TextEditingController();

    await getData();
    initiateData();
    super.onInit();
  }

  initiateData() {
    id = hamourServices.sharedPrefrences.getString("id");
    name = hamourServices.sharedPrefrences.getString("name");
  }

  gotoProducts(List<Categories> categories, int catId) {
    Get.toNamed(AppRoutes.productsScreen,
        arguments: {"categories": categories, "catId": catId});
  }

  HomeData homeData = HomeData(Get.find());

  // List data = [];
  // List hotItems=[];
  List<Categories> categories = [];
  List<Products> products = [];
  List<Offers> offers = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData(1);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // categories.addAll(response['categories']);
        response['categories']
            .forEach((value) => categories.add(Categories.fromJson(value)));
        response['offers']
            .forEach((value) => offers.add(Offers.fromJson(value)));
        response['products'].forEach((value) {
          products.add(Products.fromJson(value));
          products.shuffle();
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
