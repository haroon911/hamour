
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: 8, horizontal: 1),
        child: Card(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(80)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      "balance".tr,
                      style:
                          Theme.of(context).textTheme.headlineMedium,
                    ),
                  ]),
                  Row(children: [
                    Text(
                      "0",
                      style:
                          Theme.of(context).textTheme.headlineMedium,
                    ),
                  ]),
                ],
              ),
            )),
      ),
    );
  }
}
