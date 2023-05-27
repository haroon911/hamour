import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/functions/data_handler_controller.dart';
import 'package:hamour/core/services/services.dart';
import 'package:hamour/data/source/remote/home/address_data.dart';

class AddAddressDetailsController extends GetxController {
  HamourServices hamourServices = HamourServices();
  StatusRequest statusRequest = StatusRequest.success;
  late double lat;
  late double lng;
  late List<Placemark> placemarks;
  late TextEditingController customerNameController;
  late TextEditingController phoneController;
  late TextEditingController streetController;
  late TextEditingController moreDetailsController;
  late String country;
  late String city;
  late String street;
  initialData() async {
    customerNameController = TextEditingController();
    phoneController = TextEditingController();
    streetController = TextEditingController();
    moreDetailsController = TextEditingController();
    placemarks = await placemarkFromCoordinates(lat, lng);
    country = placemarks[0].street.toString();
    city = placemarks[0].locality.toString();
    street = placemarks[0].country.toString();
  }

  @override
  void onInit() {
    lat = Get.arguments["lat"];
    lng = Get.arguments["lng"];
    initialData();
    super.onInit();
  }

  AddressData addressData = AddressData(Get.find());

  List data = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.addAddress(
      latitude: lat,
      longitude: lng,
      storeId: hamourServices.sharedPrefrences.getString("store_id")!,
      city: city,
      country: country,
      details: moreDetailsController.text,
      street: street,
    );
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
}
