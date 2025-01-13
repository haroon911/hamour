import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/drawer_controller.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/home/wallet_data.dart';

class DashBoardController extends GetxController {
  HamourServices hamourServices = Get.find();
  HamourDrawerController drawerController = Get.put(HamourDrawerController());
  late String name;
  late String email;
  late int balance;
  late TextEditingController cardController;
  late TextEditingController balanceController;

  goToOrder() {
    Get.toNamed(AppRoutes.walletScreen);
  }

  signout() {
    
  }

  initialVariables() {
    name = hamourServices.sharedPrefrences.getString("name")!;
    email = hamourServices.sharedPrefrences.getString("email")!;
    balance = hamourServices.sharedPrefrences.getInt("balance")!;
    balanceController = TextEditingController();
    cardController = TextEditingController();

    userId = hamourServices.sharedPrefrences.getString("id")!;

    update();
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
    initialVariables();
    super.onInit();
  }
}
