import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/screens/home/home.dart';

class HomeScreenController extends GetxController {
  int currentPage = 0;
  List<Widget> pages = [
    const _TestPages(title: "التحكم"),
    const _TestPages(title: "منتجاتي"),
    const Home(),
    const _TestPages(title: "الفئات"),
    const _TestPages(title: "السلة"),
  ];
  goToPage(int pageIndex) {
    currentPage = pageIndex;
    update();
  }
}

class _TestPages extends StatelessWidget {
  const _TestPages({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(title)],
        ),
      ),
    );
  }
}
