import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onTap,
    this.width,
    this.height,
    this.title,
  });
  final double? width;
  final double? height;
  final String? title;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).colorScheme.onBackground,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: height ?? 50,
            width: width ?? MediaQuery.of(context).size.width - 100,
            child: Center(
              child: Text(
                (title ?? 'end').tr,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
            ),
          )),
    );
  }
}
