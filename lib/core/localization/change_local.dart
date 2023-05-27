import 'dart:ui';

import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

import '../functions/check_permission.dart';

// import 'translation.dart';

class LocalController extends GetxController {
  HamourServices hamourServices = Get.find();
  late Locale language;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    hamourServices.sharedPrefrences.setString('lang', langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    checkLocationPermission();
    String? sharedPrefLang = hamourServices.sharedPrefrences.getString('lang');
    if (sharedPrefLang == 'ar') {
      language = const Locale("ar");
    } else if (sharedPrefLang == "en") {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
