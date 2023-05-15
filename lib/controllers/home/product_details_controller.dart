import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:hamour/data/models/products.dart';

class ProductDetailsController extends GetxController {
  late Products product;
  CarouselController imageController = CarouselController();
  CarouselController thumbnailImageController = CarouselController();
  int currentPage = 0;

  onImageControllerChanged(int index) {
    thumbnailImageController.animateToPage(index,
        duration: const Duration(milliseconds: 100));
    currentPage = index;
    update();
  }

  onthumbnailImageControllerChanged(int index) {
    imageController.animateToPage(index,
        duration: const Duration(milliseconds: 100));
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    product = Get.arguments["product"];
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);// hide status bar
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values); // to re-show bars
    super.onInit();
  }
}
