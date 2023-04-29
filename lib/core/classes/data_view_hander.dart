import 'package:flutter/material.dart';
import 'package:hamour/core/classes/status_request.dart';
import 'package:hamour/core/constants/image_assets.dart';
import 'package:lottie/lottie.dart';

class DataViewHandler extends StatelessWidget {
  const DataViewHandler({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.post = false,
  });
  final Widget widget;
  final StatusRequest statusRequest;
  final bool post;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAssets.loading1))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
                  Lottie.asset(ImageAssets.noConnection),
                  const Text("Oops your'e offline.. "),
                ],
              ))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.storage_rounded),
                      Lottie.asset(ImageAssets.serverFailur),
                      const Text("Oops Server is on prepare.."),
                    ],
                  ))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(ImageAssets.womanNoData),
                            // Lottie.asset(ImageAssets.serverFailur),
                            // Icon(Icons.query_stats_rounded),
                            const Text("query not found .."),
                          ],
                        ),
                      )
                    : widget;
  }
}

class DataRequestHandler extends StatelessWidget {
  const DataRequestHandler({
    super.key,
    required this.statusRequest,
    required this.widget,
    this.post = false,
  });
  final Widget widget;
  final StatusRequest statusRequest;
  final bool post;
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAssets.loading1))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Icons.signal_wifi_connected_no_internet_4_outlined),
                  Lottie.asset(ImageAssets.noConnection),
                  const Text("Oops your'e offline.. "),
                ],
              ))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.storage_rounded),
                      Lottie.asset(ImageAssets.serverFailur),
                      const Text("Oops Server is on prepare.."),
                    ],
                  ))
                : widget;
  }
}
