
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/components/home_screen/continues_icon_button.dart';

class AppBarProductDetails extends PreferredSize {
  const AppBarProductDetails({
    super.key,
    required super.child,
    required super.preferredSize,
    required this.rating,
  });
  // Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final double rating;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(children: [
          ContinuesIconButton(onPressed: () {
            Get.back();
          }),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.star_rounded,
                      size: 18,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}