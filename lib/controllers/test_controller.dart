import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/classes/status_request.dart';
import '../core/functions/data_handler_controller.dart';
import '../data/source/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  late StatusRequest statusRequest;
  List data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      // statusRequest = StatusRequest.serverFailure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
