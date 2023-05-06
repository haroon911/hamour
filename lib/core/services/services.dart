import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HamourServices extends GetxService {
  late SharedPreferences sharedPrefrences;

  Future<HamourServices> init() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await Firebase.initializeApp();
    }
    sharedPrefrences = await SharedPreferences.getInstance();
    /*here i called all languages like en - ar from hamour translations
      and changed them into list to check if device has the language that we have or not*/
    return this;
  }
}

settingLanguage() {}

// here we put any service that we want to start when we run the application
initailServices() async {
  await Get.putAsync(() => HamourServices().init());
}
