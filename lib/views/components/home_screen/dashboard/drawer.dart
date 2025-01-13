import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/dashboard_controller.dart';
import 'package:hamour/controllers/home/drawer_controller.dart';
import 'package:hamour/core/constants/api_links.dart';
import 'package:hamour/views/screens/responsive.dart';

class HamourDrawer extends StatelessWidget {
  const HamourDrawer({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    // Get.lazyPut(() => HamourDrawerController());
    // Get.find<HamourDrawerController>();
    DashBoardController dashBoardController = Get.find<DashBoardController>();
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: GetBuilder<HamourDrawerController>(
                builder: (controller) => Column(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 20),
                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                child: Image.network(
                                  "${ApiLinks.productImages}/user.png",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )),
                            const SizedBox(width: 10),
                            Text(dashBoardController.name),
                            Text(dashBoardController.email),
                          ],
                        ),
                        SizedBox(
                          height: Responsive.isMobile(context) ? 40 : 80,
                        ),
                        ...List.generate(
                          controller.menu.length,
                          (index) => Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(6.0),
                              ),
                              color: controller.menuIndex == index
                                  ? Theme.of(context).colorScheme.secondary
                                  : Colors.transparent,
                            ),
                            child: InkWell(
                              onTap: () {
                                controller.onMenuChange(index);
                                scaffoldKey.currentState!.closeDrawer();
                                controller.menu[index].onTap();
                              },
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 13, vertical: 7),
                                    child: Icon(
                                      controller.menu[index].icon,
                                      color: controller.menuIndex == index
                                          ? Colors.white
                                          : Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                    ),
                                  ),
                                  Text(
                                    controller.menu[index].title.tr,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: controller.menuIndex == index
                                            ? Colors.white
                                            : Colors.grey,
                                        fontWeight:
                                            controller.menuIndex == index
                                                ? FontWeight.w600
                                                : FontWeight.normal),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ))),
      ),
    );
  }
}
