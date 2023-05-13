import 'package:flutter/material.dart';
import 'package:hamour/views/components/home_screen/dashboard/controll_buttons.dart';
import 'package:hamour/views/components/home_screen/dashboard/wallet_card.dart';
import 'package:hamour/views/components/home_screen/dashboard/drawer.dart';

import '../../responsive.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

    return Scaffold(
      key: scaffoldKey,
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () => scaffoldKey.currentState!.openDrawer()),
      drawer: !Responsive.isDesktop(context)
          ? SizedBox(
              width: 250,
              child: HamourDrawer(
                scaffoldKey: scaffoldKey,
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
