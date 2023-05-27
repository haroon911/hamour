import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: Icon(
            FontAwesomeIcons.warehouse,
            size: 200,
            color: Colors.amber.shade800,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoutes.addressScreen);
        },
        child: const Icon(Icons.add_location_alt_rounded),
      ),
    );
  }
}
