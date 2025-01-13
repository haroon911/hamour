import 'package:get/get.dart';
import 'package:hamour/data/models/categories.dart';
import 'package:hamour/data/source/remote/home/categories_data.dart';

class CategoriesController extends GetxController {
  late Categories cat;
  CategoriesData response = CategoriesData(Get.find());
}
