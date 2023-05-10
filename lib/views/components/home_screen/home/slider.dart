import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/api_links.dart';

import '../../../../controllers/home/home_controller.dart';

class HamourCarouselSlider extends StatelessWidget {
  const HamourCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return CarouselSlider.builder(
      itemCount: controller.offers.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          SlideImages(
              image:
                  "${ApiLinks.offerImages}/${controller.offers[itemIndex].image}"),
      options: CarouselOptions(
        // height: 200,

        aspectRatio: 16 / 7,
        // aspectRatio: 14 / 6,
        // viewportFraction: 0.8,
        viewportFraction: 0.97,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}


class SlideImages extends StatelessWidget {
  const SlideImages({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          image,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}
