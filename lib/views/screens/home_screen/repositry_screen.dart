import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/repositry_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/views/components/home_screen/dashboard/drawer.dart';
import 'package:hamour/views/components/home_screen/home/store_repositry/repo_product_card.dart';
import 'package:hamour/views/components/home_screen/surfing_appbar.dart';
import 'package:hamour/views/screens/responsive.dart';

class RepositryScreen extends StatelessWidget {
  const RepositryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RepositryController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
          heroTag: "cartHero",
          label: Text("cart".tr),
          icon: const Icon(Icons.shopping_cart_rounded),
          onPressed: () => Get.toNamed(AppRoutes.cartScreen)),
      // floatingActionButton: FloatingActionButton.extended(
      //     heroTag: "repoHero",
      //     label: Text("menu".tr),
      //     icon: const Icon(Icons.menu_rounded),
      //     onPressed: () => scaffoldKey.currentState!.openDrawer()),

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
            GetBuilder<RepositryController>(
              builder: (controller) => DataRequestHandler(
                  statusRequest: controller.statusRequest,
                  widget: MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.repositryProducts.length,
                    itemBuilder: (context, index) {
                      return RepoProductCard(
                        product: controller.repositryProducts[index],
                        controller: controller,
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
