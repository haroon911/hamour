import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/dashboard_controller.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/views/components/home_screen/dashboard/dash_card.dart';
import 'package:hamour/views/screens/responsive.dart';

class ControllButtons extends GetView<DashBoardController> {
  const ControllButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DashButtonContent> buttonDetails = [
      DashButtonContent(
          title: "orderStatus",
          content: "seeOrders",
          icon: FontAwesomeIcons.store,
          onTap: () {}),
      DashButtonContent(
          title: "wallet",
          content: "chargeWallet",
          icon: FontAwesomeIcons.wallet,
          onTap: () {
            Get.toNamed(AppRoutes.walletScreen);
            print("Hello");
          }),
      DashButtonContent(
          title: "messages",
          content: "seeMessages",
          icon: FontAwesomeIcons.message,
          onTap: () {}),
      DashButtonContent(
          title: "supportingCenter",
          content: "contact",
          icon: FontAwesomeIcons.handshakeSimple,
          onTap: () {}),
      DashButtonContent(
          title: "aboutUs",
          content: "aboutHamour",
          icon: FontAwesomeIcons.warehouse,
          onTap: () {}),
      DashButtonContent(
          title: "signout",
          content: "signoutFromHamour",
          icon: FontAwesomeIcons.arrowRightFromBracket,
          onTap: () {
            controller.signout();
          }),
    ];
    return SizedBox(
      // height: 500,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: buttonDetails.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
              mainAxisSpacing: 12.0),
          itemBuilder: (context, index) => DashButtons(
            title: buttonDetails[index].title.tr,
            content: buttonDetails[index].content.tr,
            icon: buttonDetails[index].icon,
            onTap: buttonDetails[index].onTap,
          ),
        ),
      ),
    );
  }
}
