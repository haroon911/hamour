import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthIntroduction extends StatelessWidget {
  const AuthIntroduction({
    super.key,
    required this.title,
    required this.subTitle,
    this.extra = '',
  });
  final String title;
  final String subTitle;
  final String extra;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title.tr,
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            subTitle.tr,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          addText(extra),
        ],
      ),
    );
  }
}

Widget addText(String extra) {
  if (extra.isEmpty) {
    return const SizedBox();
  } else {
    return Text(
      extra.tr,
      style: Get.theme.textTheme.bodyLarge,
      textAlign: TextAlign.center,
    );
  }
}
