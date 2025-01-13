import 'package:get/get.dart';

class SizeConfig {
  static double getProperateHight(double inputHeight) {
    return (inputHeight / 812.0) * Get.height;
  }

  static double getProperateWidth(double width) {
    return (width / 375.0) * Get.width;
  }
}
