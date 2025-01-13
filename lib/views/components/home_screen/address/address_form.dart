import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/address/add_address_details_controller.dart';
import 'package:hamour/core/functions/input_validation.dart';
import 'package:hamour/views/components/home_screen/widgets/custome_input.dart';

class AddressForm extends GetView<AddAddressDetailsController> {
  const AddressForm({super.key, this.formKey});
  final GlobalKey? formKey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "customerInfo".tr,
          ),
          // Text("${placemarks[0].street}"),
          const SizedBox(height: 10),
          CustomInput(
              validator: (value) => textInputValidator(value!),
              controller: controller.customerNameController,
              labelText: "customerName",
              hintText: "enterCustomerName"),
          // const SizedBox(height: 10),
          CustomInput(
              keyboardType: TextInputType.phone,
              validator: (value) => phoneInputValidator(value!),
              controller: controller.phoneController,
              labelText: "phoneNumber",
              hintText: "contactNumber"),
          CustomInput(
              validator: (value) => textInputValidator(value!),
              controller: controller.streetController,
              labelText: "street",
              hintText: "enterStreet"),
          CustomInput(
              controller: controller.moreDetailsController,
              labelText: "moreDetails",
              hintText: "enterMoreDetails"),
        ],
      ),
    );
  }
}
