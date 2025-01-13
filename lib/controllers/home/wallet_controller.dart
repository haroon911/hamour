import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/home/wallet_data.dart';


class WalletController extends GetxController {
  HamourServices hamourServices = Get.find();
  late TextEditingController cardController;
  late TextEditingController balanceController;
  late int balance;


  signout() {
    hamourServices.sharedPrefrences.clear();
    Get.offAllNamed(AppRoutes.login);
  }

  onChargingWallet() async {
    await getData();
  }

  StatusRequest statusRequest = StatusRequest.noState;
  WalletData walletData = WalletData(Get.find());

  late String userId;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await walletData.addBalance(
        balance: balanceController.text, userId: userId);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        hamourServices.sharedPrefrences.setInt("balance", response['balance']);
        balance = hamourServices.sharedPrefrences.getInt("balance")!;
        Get.defaultDialog(
            title: "transaction".tr,
            content:
                Text("${"transactionSuccess".tr}\n${balanceController.text}"),
            confirm: ElevatedButton(
                onPressed: () {
                  Get.close(0);
                },
                child: Text("ok".tr)));
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
    balanceController = TextEditingController();
    cardController = TextEditingController();
    balance = hamourServices.sharedPrefrences.getInt("balance")!;
    userId = hamourServices.sharedPrefrences.getString("id")!;
    super.onInit();
  }
}
