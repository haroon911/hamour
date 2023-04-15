import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class AuthRecommendation extends StatelessWidget {
  const AuthRecommendation({
    super.key,
    this.onTap,
    required this.question,
    required this.recommend,
  });

  // final LoginController controller;
  final void Function()? onTap;
  final String question;
  final String recommend;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            question.tr,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            onTap: onTap,
            child: Text(
              recommend.tr,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
