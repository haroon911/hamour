import 'package:flutter/material.dart';
import 'package:hamour/views/components/home_screen/dashboard/controll_buttons.dart';
import 'package:hamour/views/components/home_screen/dashboard/wallet_card.dart';
import 'package:hamour/views/components/home_screen/dashboard/drawer.dart';

import '../../responsive.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    return Scaffold(
      key: _scaffoldKey,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _scaffoldKey.currentState!.openDrawer()),
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(
              width: 250,
              child: HamourDrawer(
                scaffoldKey: _scaffoldKey,
              ))
          : null,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: const [
              WalletCard(),
              ControllButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
