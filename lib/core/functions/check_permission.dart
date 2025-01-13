import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

Future checkLocationPermission({bool checkEnabled=true}) async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled && checkEnabled) {

      Get.snackbar("warning".tr, "LocationNotenabled".tr);
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar("warning".tr, "LocationDenied".tr);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
        Get.snackbar("warning".tr, "LocationPermanentlyDenied".tr);
      
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // return await Geolocator.getCurrentPosition();
  }