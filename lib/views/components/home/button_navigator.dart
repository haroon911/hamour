import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class ButtonNavigator extends StatelessWidget {
  const ButtonNavigator(
      {super.key,
      this.onPressed,
      required this.title,
      required this.icon,
      this.selectedColor});
  final void Function()? onPressed;
  final String title;
  final IconData icon;
  final Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedColor ?? Theme.of(context).colorScheme.primary,
          ),
          Text(
            title.tr,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
