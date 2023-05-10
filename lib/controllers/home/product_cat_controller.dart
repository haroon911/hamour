import 'package:get/get.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/data/models/categories.dart';
import 'package:hamour/data/source/remote/home/home_data.dart';

class ProductCatController extends GetxController {
  List<Categories> categories = [];
  List<Categories> restCategories = [];
  late int selectedCatIndex;
  late int newLevel;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  @override
  onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    // restCategories.clear();
    // categories.clear();
    // selectedCatIndex = 0;
    // newLevel = 0;
    categories = Get.arguments["categories"];
    selectedCatIndex = Get.arguments["selectedCatIndex"];
    // newLevel = categories[selectedCatIndex].level + 1;
    for (int i = 0; i < categories.length; i++) {

      if (categories[i].categoryCode == categories[selectedCatIndex].categoryCode) {
        restCategories.add(categories[i]);
      }
    }
    if (categories.isNotEmpty) {
      newLevel = categories[selectedCatIndex].level + 1;
    }
  }

  gotoProducts(List<Categories> categories, int selectedCatIndex) {
    Get.toNamed(AppRoutes.productsScreen,
        arguments: {
          "categories": categories,
          "selectedCatIndex": selectedCatIndex,
          // "catId": catId
        },
        preventDuplicates: false);
    onInit();
    // Get.delete<ProductCatController>();
  }
}
