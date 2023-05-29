import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/data/models/add_order_model.dart';
import 'package:hamour/data/source/remote/home/order_data.dart';

class AddOrderController extends GetxController {
  List<Marker> markers = [];
  late AddOrderModel addOrderModel;
  StatusRequest statusRequest  =StatusRequest.noState; 
  initialData() {
    addOrderModel = Get.arguments['customerInfo'];
    markers.add(Marker(
        markerId: const MarkerId("1" ),
        position: LatLng(addOrderModel.latitude, addOrderModel.longitude)));
    // print("${Get.arguments['customerInfo']}");
  }
  OrderData orderData = OrderData(Get.find());
  late List<AddOrderModel> orderList ; 
  addOrderData()async{
    statusRequest = StatusRequest.loading;
    var response = await orderData.addOrder(addOrderModel: addOrderModel);
    statusRequest = dataHandler(response);
    debugPrint("+++++++++++ $statusRequest");
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        orderList.addAll(response['orders']);
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
    initialData();
    super.onInit();
  }
}
