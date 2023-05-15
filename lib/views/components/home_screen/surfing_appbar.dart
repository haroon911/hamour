import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/components/home_screen/continues_icon_button.dart';

class SurfingAppBar extends StatelessWidget {
  const SurfingAppBar({
    super.key, this.onBackPressed,
  });
  final Function()? onBackPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15)
          .copyWith(top: 40),
      child: Row(
        children: [
          ContinuesIconButton(onPressed:onBackPressed),
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor.withAlpha(0),
                    contentPadding: const EdgeInsets.all(15),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 146, 146, 146),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    hintText: "searchHere".tr,
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 131, 131, 131))),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Card(
            child: SizedBox(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none,
                    size: 35,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
