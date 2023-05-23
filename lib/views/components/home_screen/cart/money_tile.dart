import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class MoneyTile extends StatelessWidget {
  const MoneyTile({
    super.key,
    required this.price,
  });
  final double price;
  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
        text: '${price}'.tr,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: Colors.green),
      ),
      TextSpan(
        text: 'riyal'.tr,
        style: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(color: Colors.grey),
      ),
    ]));
  }
}
/** Text(
          '${price.round()}0000'.tr,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: Colors.green),
        ),
        Text(
          'riyal'.tr,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Colors.grey),
        ) */