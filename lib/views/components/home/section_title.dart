import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10)
          .copyWith(bottom: 10, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.tr,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          GestureDetector(
            onTap: onTap,
            child: Opacity(
              opacity: 0.5,
              child: Text(
                "see_more".tr,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
