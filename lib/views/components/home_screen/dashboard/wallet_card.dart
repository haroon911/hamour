import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/dashboard_controller.dart';
import 'package:hamour/core/constants/api_links.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    //  Get.find();
    return SizedBox(
      // height: 150,
      child: GetBuilder<DashBoardController>(builder: (controller) {
        return Stack(
          children: [
            SizedBox(
              // height: 140,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 40),
                          Row(children: [
                            const SizedBox(width: 20),
                            Text(
                              "balance".tr,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${controller.balance} ${"riyal".tr}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(color: Colors.green),
                            ),
                          ]),
                        ],
                      ),
                    )),
              ),
            ),
            Row(
              children: [
                const SizedBox(width: 20),
                Card(
                    child: CachedNetworkImage(
                  imageUrl: "${ApiLinks.productImages}/user.png",
                  placeholder: (context, url) =>
                      Image.asset("assets/images/users/profile.jpg"),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )),
                const SizedBox(width: 10),
                Text(controller.name),
              ],
            ),
          ],
        );
      }),
    );
  }
}
