
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class DashButtons extends StatelessWidget {
  const DashButtons({
    super.key,
    required this.title,
    required this.icon,
    required this.content,
    this.notification = 0,
  });
  final String title;
  final IconData icon;
  final String content;
  final int? notification;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40)))),
      onPressed: () {},
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 4),
              child: Text(
                title.tr,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Text(
              content.tr,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class DashButtonContent {
  final String title;
  final IconData icon;
  final String content;
  final int? notification;

  DashButtonContent(
      {required this.title,
      required this.content,
      required this.icon,
      this.notification = 0});
}