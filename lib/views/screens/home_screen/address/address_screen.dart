import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hamour/controllers/home/address/add_address_controller.dart';
import 'package:hamour/views/components/home_screen/cart/top_bar.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final addAddressController = Get.put(AddAddressController());
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 80,
            child: TopBar(
              title: 'address',
              icon: Icons.location_on_rounded,
              leftIconString: "chooseLocation",
              onPressed: () {},
            ),
          ),
          GetBuilder<AddAddressController>(
            builder: (addAddressController) => SizedBox(
              height: MediaQuery.of(context).size.height - 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    
                    myLocationEnabled: true,
                    mapType: MapType.normal,
                    markers: addAddressController.markers.toSet(),
                    onTap: (latlng) {
                      addAddressController.addMarker(latlng);
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(addAddressController.position.latitude,
                          addAddressController.position.longitude),
                      zoom: 15,
                    ),
                    // compassEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      addAddressController.completerController
                          .complete(controller);
                    },
                  ),
                  Positioned(
                      bottom: 10,
                      child: Card(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        child: InkWell(
                            onTap: () {
                              addAddressController.onContinuePressed(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 40),
                              child: Text(
                                "continue".tr,
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                            )),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addAddressController.getCurrentPosition(),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
