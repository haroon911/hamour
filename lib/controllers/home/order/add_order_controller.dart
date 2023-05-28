import 'package:get/get.dart';
import 'package:hamour/data/models/add_order_model.dart';

class AddOrderController extends GetxController {
  late List<AddOrderModel> addOrderModel;
  initialData() {
    addOrderModel.add(Get.arguments["customerInfo"]);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
