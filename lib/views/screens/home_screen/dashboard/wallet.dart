import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/wallet_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/core/functions/input_validation.dart';
import 'package:hamour/views/components/home_screen/continues_icon_button.dart';
import 'package:hamour/views/components/home_screen/widgets/custom_button.dart';
import 'package:hamour/views/components/home_screen/widgets/custome_input.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(WalletController());
    return Scaffold(
      body: GetBuilder<WalletController>(builder: (controller) {
        return DataRequestHandler(
          statusRequest: controller.statusRequest,
          widget: ListView(children: [
            Card(
              color: Theme.of(context).colorScheme.onTertiary,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(40),
                  child: ListTile(
                    leading: ContinuesIconButton(onPressed: () => Get.back()),
                    title: Text(
                      "chargeWallet".tr,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    ),
                    subtitle: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "balance".tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${controller.balance} ${"riyal".tr}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.green),
                        ),
                      ],
                    ),
                  )),
            ),
            const SizedBox(height: 40),
            Card(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomInput(
                        controller: controller.cardController,
                        validator: (value) => textInputValidator(value!),
                        labelText: "CardNumber".tr,
                        hintText: "EnterCardNumber".tr,
                        icon: Icons.paypal_rounded,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomInput(
                      validator: (value) => textInputValidator(value!),
                      controller: controller.balanceController,
                      labelText: "BalanceValue".tr,
                      hintText: "EnterBalance".tr,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      keyboardType: TextInputType.number,
                    ),
                    CustomButton(
                      title: "chargeWallet",
                      onTap: () {
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          controller.onChargingWallet();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ]),
        );
      }),
    );
  }
}
