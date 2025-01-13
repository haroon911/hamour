import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../continues_icon_button.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    this.onPressed,
    this.icon,
    this.leftIconString,
    required this.title,
  });
  final void Function()? onPressed;
  final IconData? icon;
  final String? leftIconString;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContinuesIconButton(onPressed: () {
                Get.back();
              }),
              const Spacer(),
              Text(title.tr),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ContinuesIconButton(
                      onPressed: onPressed, icon: icon ?? Icons.notifications),
                  leftIconString == null
                      ? const SizedBox()
                      : Text(
                          leftIconString!.tr,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
