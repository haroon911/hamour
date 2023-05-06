import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/home/home_data.dart';

import '../../core/classes/status_request.dart';
import '../../core/functions/data_handler_controller.dart';
import '../../data/models/categories.dart';
import '../../data/models/offers.dart';

class HomeController extends GetxController {
  HamourServices hamourServices = Get.find();

  String? name;

  String? id;
  @override
  void onInit() async {
    await getData();
    initiateData();
    super.onInit();
  }

  initiateData() {
    id = hamourServices.sharedPrefrences.getString("id");
    name = hamourServices.sharedPrefrences.getString("name");
  }

  HomeData homeData = HomeData(Get.find());

  // List data = [];
  // List hotItems=[];
  List<Categories> categories = [];
  List<Offers> offers = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // categories.addAll(response['categories']);
        response['categories']
            .forEach((value) => categories.add(Categories.fromJson(value)));
        response['offers']
            .forEach((value) => offers.add(Offers.fromJson(value)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }
}
