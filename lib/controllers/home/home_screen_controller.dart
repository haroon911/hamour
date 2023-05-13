import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/screens/home_screen/dashboard/dashboard.dart';

import '../../views/screens/home_screen/home/home.dart';

class HomeScreenController extends GetxController {
  int currentPage = 1;
  List<Widget> pages = [
    const DashBoard(),
    const Home(),
  ];
  goToPage(int pageIndex) {
    currentPage = pageIndex;
    update();
  }
}
