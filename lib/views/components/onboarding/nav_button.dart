
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class NavigationButton extends StatelessWidget {
  const NavigationButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          textStyle: MaterialStatePropertyAll(
              Theme.of(context).textTheme.displayMedium)),
      child: Text(title.tr),
    );
  }
}
