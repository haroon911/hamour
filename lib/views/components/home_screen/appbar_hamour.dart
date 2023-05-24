// import 'package:get/get.dart';
// import 'package:hamour/controllers/home/search_controller.dart';
// import 'package:hamour/core/constants/app_routes_names.dart';
// import 'package:hamour/core/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    this.onChanged,
    this.searchController,
    this.onTapSearch,
  });
  final void Function(String)? onChanged;
  final TextEditingController? searchController;
  final void Function()? onTapSearch;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  // colorScheme.primary,
                  Theme.of(context).floatingActionButtonTheme.backgroundColor!,
                  AppColor.primaryDarkColor
                ]),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30))),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Text("appName".tr,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(color: Colors.white)),
                      ]),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.cartScreen);
                            },
                            icon: const Icon(Icons.shopping_cart),
                            color: Colors.white,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications),
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 40,
            right: 40,
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              child: TextField(
                onChanged: onChanged,
                controller: searchController,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                  // controller.searchController.clear();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none),
                    hintText: "searchHere".tr,
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 131, 131, 131)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    suffixIcon: InkWell(
                        onTap: onTapSearch,
                        child: const Icon(
                          Icons.search_rounded,
                          size: 26,
                        ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
