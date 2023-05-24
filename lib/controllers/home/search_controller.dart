import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  bool searching = false;
  late TextEditingController searchController;
  onChanged(value) {
    iconSearchColor = value == ""
        ? const Color.fromARGB(255, 146, 146, 146)
        : Get.theme.colorScheme.secondary;
    update();
  }

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  onSearch() {
    searching = searchController.text == "" ? true : false;
    print("ssssssss");
    update();
  }

  Color iconSearchColor = Color.fromARGB(255, 146, 146, 146);
}
