import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/cart_controller.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/data/models/products.dart';

class ProductDetailsController extends GetxController {
  late Products product;
  CartController cartController = Get.put(CartController());
  RepositryController repositryController = Get.put(RepositryController());
  CarouselController imageController = CarouselController();
  CarouselController thumbnailImageController = CarouselController();
  int currentPage = 0;
  addToCart() {
    cartController.add(productId: product.id.toString(), stock: product.stock);
    update();
  }
  removeFromCart() {
      cartController.remove(productId: product.id.toString());
      update();
  }

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

  late StatusRequest statusRequest;
  initialData() async {
    statusRequest = StatusRequest.loading;
    product = Get.arguments["product"];
    await cartController.getProductQuantity(productId: product.id.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() async {
    await initialData();
    super.onInit();
  }
}
