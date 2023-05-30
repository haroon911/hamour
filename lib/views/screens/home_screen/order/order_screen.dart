import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hamour/controllers/home/order/add_order_controller.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/views/components/home_screen/widgets/custom_button.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put<AddOrderController>(AddOrderController());
    return Scaffold(
      appBar: AppBar(
        title: Text("customerLocation".tr),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("customerLocation".tr),
          ),
          SizedBox(
            height: 200,
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              markers: controller.markers.toSet(),

              initialCameraPosition: CameraPosition(
                target: LatLng(controller.addOrderModel.latitude,
                    controller.addOrderModel.longitude),
                zoom: 15,
              ),
              // compassEnabled: true,
              // onMapCreated: (GoogleMapController controller) {
              //   addAddressController.completerController
              //       .complete(controller);
              // },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("details".tr),
          ),
          Row(
            children: [],
          ),
          CustomButton(
              title: "order".tr,
              onTap: () async {
                await controller.addOrderData();
                Get.defaultDialog(
                    title: "success".tr, content: Text("orderSuccess".tr));
                Get.offAllNamed(AppRoutes.homePage);
              }),
        ],
      ),
    );
  }
}
