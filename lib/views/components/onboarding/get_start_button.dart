import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import '../../../core/constants/route_names.dart';

class GetStartButton extends StatelessWidget {
  const GetStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)))),
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).appBarTheme.backgroundColor),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(80))),
      onPressed: () {
        Get.offAllNamed(AppRoute.login);
      },
      child: Text(
        'Get Started'.tr,
        style: Theme.of(context)
            .textTheme
            .displayLarge
            ?.copyWith(color: Colors.white),
      ),
    );
  }
}
