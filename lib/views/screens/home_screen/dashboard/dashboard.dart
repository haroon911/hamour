import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/dashboard_controller.dart';
import 'package:hamour/views/components/home_screen/dashboard/controll_buttons.dart';
import 'package:hamour/views/components/home_screen/dashboard/wallet_card.dart';
import 'package:hamour/views/components/home_screen/dashboard/drawer.dart';

import '../../responsive.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    Get.put(DashBoardController());

    return Scaffold(
      key: scaffoldKey,
      floatingActionButton: FloatingActionButton.extended(
          label: Text("menu".tr),
          icon: const Icon(Icons.menu_rounded),
          onPressed: () => scaffoldKey.currentState!.openDrawer()),
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(
              width: 250,
              child: HamourDrawer(
                scaffoldKey: scaffoldKey,
              ))
          : null,
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<DashBoardController>(builder: (controller) {
            return Column(
              children: [
                const WalletCard(),
                const ControllButtons(),
                Container(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
