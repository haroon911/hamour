import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hamour/views/components/home_screen/dashboard/dash_card.dart';
import 'package:hamour/views/screens/responsive.dart';

class ControllButtons extends StatelessWidget {
  const ControllButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DashButtonContent> buttonDetails = [
      DashButtonContent(
          title: "new orders",
          content: "seeOrders",
          icon: FontAwesomeIcons.store),
      DashButtonContent(
          title: "order status",
          content: "seeOrders",
          icon: FontAwesomeIcons.addressCard),
      DashButtonContent(
          title: "messages",
          content: "seeOrders",
          icon: FontAwesomeIcons.message),
      DashButtonContent(
          title: "supporting center",
          content: "contact",
          icon: FontAwesomeIcons.handshakeSimple),
    ];
    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: buttonDetails.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
              crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
              mainAxisSpacing: 12.0),
          itemBuilder: (context, index) => DashButtons(
            title: buttonDetails[index].title,
            content: buttonDetails[index].content,
            icon: buttonDetails[index].icon,
          ),
        ),
      ),
    );
  }
}
