import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HamourServices extends GetxService {
  late SharedPreferences sharedPrefrences;

  Future<HamourServices> init() async {
    if (!kIsWeb) {
      if (Platform.isAndroid || Platform.isIOS) {
        await Firebase.initializeApp();
      }
    }
    sharedPrefrences = await SharedPreferences.getInstance();
    if (sharedPrefrences.getString("step") != null) {
      if (sharedPrefrences.getString("step") == "2") {
        if (sharedPrefrences.getBool('isDarkMode') == null) {
          sharedPrefrences.setBool("isDarkMode", Get.isDarkMode);
        }
        if (sharedPrefrences.getBool("isDarkMode")!) {
          Get.changeThemeMode(ThemeMode.dark);
        } else {
          Get.changeThemeMode(ThemeMode.light);
        }
      }
    }
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
