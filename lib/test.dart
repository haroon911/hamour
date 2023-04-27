import 'package:flutter/material.dart';

import 'core/functions/check_connection.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  initailData() async {
    var res = await checkInternetConnection();
    debugPrint(res);
  }

  @override
  void initState() {
    initailData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("test")),
    );
  }
}
