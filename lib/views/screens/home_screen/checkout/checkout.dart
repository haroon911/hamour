import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/views/components/home_screen/dashboard/dash_card.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("checkout".tr),
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Text("choseCheckout".tr),
          Card(
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(80)),
            child: Row(
              children: [Text("wallet".tr), const Icon(Icons.wallet_rounded)],
            ),
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [],
          ),
        ],
      ),
    );
  }
}
