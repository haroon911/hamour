import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/app_routes_names.dart';

class AddAddressController extends GetxController {
  StatusRequest statusRequest = StatusRequest.success;
  List<Marker> markers = [];
  LatLng? markerLatlng;

  Position position = Position(
    latitude: 15.3694,
    longitude: 44.1910,
    timestamp: DateTime.now(),
    accuracy: 10,
    altitude: 2259,
    heading: 0,
    speed: 0,
    speedAccuracy: 0,
  );
  final Completer<GoogleMapController> completerController = Completer();
  Future<GoogleMapController> get _mapController async =>
      await completerController.future;
  void onMapCreated(GoogleMapController controller) {
    completerController.complete(controller);
    updateCameraPosition();
  }

  Future<void> getCurrentPosition() async {
    Position currentPosition = await Geolocator.getCurrentPosition();
    position = currentPosition;
    update();
    updateCameraPosition();
  }

  Future<void> updateCameraPosition() async {
    final controller = await _mapController;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 16,
        ),
      ),
    );
  }

  addMarker(LatLng latlng) async {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId("1"),
      infoWindow: InfoWindow(title: "customerInfo".tr),
      position: latlng,
    ));
    markerLatlng = latlng;

    update();
  }

  onContinuePressed(BuildContext context) {
    if (markerLatlng != null) {
      Get.toNamed(AppRoutes.addressDetailsScreen, arguments: {
        "lat": markerLatlng!.latitude,
        "lng": markerLatlng!.longitude,
      });
      // _showAddressDetailsBottomSheet(context);
    } else {
      Get.defaultDialog(
          title: "warning".tr,
          content: Text("chooseAddress".tr),
          confirm: ElevatedButton(
              onPressed: () {
                Get.close(0);
              },
              child: Text("ok".tr)));
    }
  }

  // void _showAddressDetailsBottomSheet() {
  //   Get.bottomSheet(
  //       DraggableScrollableSheet(
  //         expand: false,
  //         initialChildSize: 0.6,
  //         minChildSize: 0.19,
  //         maxChildSize: 0.9,
  //         builder: (context, scrollController) => SingleChildScrollView(
  //             controller: scrollController,
  //             physics: const NeverScrollableScrollPhysics(),
  //             child: const AddressDetailsScreen()),
  //       ),
  //       isScrollControlled: true);
  // }

  @override
  void onInit() {
    // getCurrentPosition();
    super.onInit();
  }
}
