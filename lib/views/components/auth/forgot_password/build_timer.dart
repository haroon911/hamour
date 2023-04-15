import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class BuildTimer extends StatelessWidget {
  const BuildTimer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text('codeExpire'.tr),
      TweenAnimationBuilder(
        duration: const Duration(seconds: 300),
        tween: Tween(begin: 60.0, end: 0),
        builder: (BuildContext context, dynamic value, Widget? child) {
          // minusts
          return Text("00:${value.toInt()}");
        },
        onEnd: () {},
      ),
    ]);
  }
}
