import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ColorScheme colorScheme = Theme.of(context).colorScheme;
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
                            iconSize: 30,
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
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Material(
                shadowColor: Colors.black,
                elevation: 3,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                // borderRadius: BorderRadius.circular(15),
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      // fillColor: Colors.white,
                      fillColor:
                          Theme.of(context).splashColor.withOpacity(0.15),
                      contentPadding: const EdgeInsets.all(10),
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
          ),
        ],
      ),
    );
  }
}

// class SearchBar extends StatelessWidget {
//   const SearchBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       width: 120,
//       // width: double.infinity,
//       padding: const EdgeInsets.all(5),
//       margin: const EdgeInsets.all(10).copyWith(right: 40, left: 40),
//       decoration: BoxDecoration(
//           color: Theme.of(context).colorScheme.background.withOpacity(0.8),
//           borderRadius: BorderRadius.circular(50)),
//       child: Row(
//         children: [
//           IconButton(
//               onPressed: () {},
//               icon: const Icon(
//                 Icons.search,
//               ))
//         ],
//       ),
//     );
//   }
// }
