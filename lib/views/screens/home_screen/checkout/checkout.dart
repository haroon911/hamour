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
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text("choseCheckout".tr),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: const [
              DashButtons(
                  title: "title",
                  content: "content",
                  icon: Icons.payments_rounded),
              DashButtons(
                  title: "title",
                  content: "content",
                  icon: Icons.payments_rounded),
            ],
          ),
        ],
      ),
    );
  }
}
