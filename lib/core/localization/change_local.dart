import 'dart:ui';

import 'package:get/get.dart';
import 'package:hamour/core/services/services.dart';

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
    // String? sharedPrefLang = hamourServices.sharedPrefrences.getString('lang');
    // language = sharedPrefLang == null
    //     ? HamourTranslations()
    //             .keys
    //             .keys
    //             .toList()
    //             .contains(Get.deviceLocale!.languageCode)
    //         ? Get.deviceLocale!
    //         : const Locale('en')
    //     : Locale(sharedPrefLang);
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
