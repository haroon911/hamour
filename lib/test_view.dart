import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/test_controller.dart';

import 'core/classes/data_view_hander.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test api'),
      ),
      body: GetBuilder<TestController>(
        builder: (controller) {
          return DataRequestHandler( // added from class that i created
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              },
            ),
          );
        },
      ),
    );
  }
}
