import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:hamour/views/screens/home_screen/dashboard/dashboard.dart';

import '../../views/screens/home_screen/home/home.dart';

class HomeScreenController extends GetxController {
  //hiding bottom bar
  final _isVisible = true.obs;
  final _hideButtonController = ScrollController();
  bool get isVisible => _isVisible.value;
  ScrollController get hideButtonController => _hideButtonController;
  //end hidding bottom bar
  int currentPage = 1;
  List<Widget> pages = [
    const DashBoard(),
    const Home(),
  ];
  goToPage(int pageIndex) {
    currentPage = pageIndex;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    _hideButtonController.addListener(() async {
      _isVisible.value = _hideButtonController.position.userScrollDirection ==
              ScrollDirection.forward
          ? true
          : false;
    });
  }
}
