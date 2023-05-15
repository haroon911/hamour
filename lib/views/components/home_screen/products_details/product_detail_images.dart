import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/product_details_controller.dart';
import 'package:hamour/core/constants/api_links.dart';

class ProductDetailImages extends StatelessWidget {
  const ProductDetailImages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            CarouselSlider.builder(
              carouselController: controller.imageController,
              itemCount: controller.product.images.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      SizedBox(
                child: Card(
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    clipBehavior: Clip.antiAlias,
                    child: Hero(
                      tag:
                          "image${controller.product.id}no${controller.product.images.indexOf(controller.product.images.first)}",
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ApiLinks.productImages}/${controller.product.images[itemIndex]}",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        placeholder: (context, url) =>
                            const Text("no_image.jpg"),
                      ),
                    )),
              ),
              options: CarouselOptions(
                aspectRatio:
                    MediaQuery.of(context).size.width > 500 ? 16 / 9 : 1.3,
                viewportFraction: 1.1,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  controller.onImageControllerChanged(index);
                },
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
        const Positioned(
          bottom: 0,
          child: ThumbnailImageSilder(),
        ),
      ],
    );
  }
}

// ---------------- Thmubnails

class ThumbnailImageSilder extends StatelessWidget {
  const ThumbnailImageSilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductDetailsController controller = Get.find();
    return SizedBox(
      height: 70,
      width: MediaQuery.of(context).size.width / 1.5,
      child: CarouselSlider.builder(
        carouselController: controller.thumbnailImageController,
        itemCount: controller.product.images.length,
        itemBuilder: (context, index, realIndex) => GestureDetector(
          onTap: () {
            controller.onImageControllerChanged(index);
          },
          child: Opacity(
            opacity: controller.currentPage == index ? 0.95 : 0.6,
            child: Card(
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "${ApiLinks.productImages}/${controller.product.images[index]}",
                height: 50,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        options: CarouselOptions(
          // aspectRatio: 0.5,
          viewportFraction: 0.3,
          initialPage: 0,
          reverse: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeFactor: 0.2,
          onPageChanged: (index, reason) {
            controller.onthumbnailImageControllerChanged(index);
          },
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
        ),
      ),
    );
  }
}
