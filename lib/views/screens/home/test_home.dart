import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
   Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: Color(0x4B1A1F24),
                    offset: Offset(0, 2),
                  )
                ],
                gradient: const LinearGradient(
                  colors: [
                    // Theme.of(context).cardColor,
                    // Theme.of(context).colorScheme.background,

                    Color.fromARGB(255, 15, 84, 140),
                    Color.fromARGB(255, 252, 169, 68)
                  ],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0.94, -1),
                  end: AlignmentDirectional(-0.94, 1),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text("هامور"),
                ],
              ),
            ),
            Stack(
              children: [
                const HamourCarouselSlider(),
                Container(
                  height: 40,
                  width: 120,
                  // width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.all(10).copyWith(right: 40, left: 40),
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.9),
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HamourCarouselSlider extends StatelessWidget {
  const HamourCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> itemsBuild = List.generate(
        5,
        (i) => SlideImages(
            image: "assets/images/slider_images/slide${i + 1}.jpg"));

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        aspectRatio: 16 / 9,
        // viewportFraction: 0.8,
        viewportFraction: 1.1,
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
      items: itemsBuild,
    );
  }
}

class SlideImages extends StatelessWidget {
  const SlideImages({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
