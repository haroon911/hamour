import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/screens/test/dashboard.dart';

import '../../views/screens/home/home.dart';

class HomeScreenController extends GetxController {
  int currentPage = 2;

  List<Widget> pages = [
    const DashBoard(),
    const _TestPages(title: "الفئات"),
    const Home(),
    const _TestPages(title: "منتجاتي"),
  ];
  goToPage(int pageIndex) {
    currentPage = pageIndex;
    update();
  }
}

class _TestPages extends StatelessWidget {
  const _TestPages({required this.title});
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
