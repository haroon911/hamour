import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/components/home_screen/dashboard/drawer.dart';
import 'package:hamour/views/components/home_screen/surfing_appbar.dart';
import 'package:hamour/views/screens/responsive.dart';

class RepositryScreen extends StatelessWidget {
  const RepositryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: "repoHero",
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
        child: Column(
          children: [
            SurfingAppBar(onBackPressed: () => Get.close(0)),

          ],
        ),
      ),
    );
  }
}
