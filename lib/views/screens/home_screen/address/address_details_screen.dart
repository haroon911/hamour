// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hamour/controllers/home/address/add_address_details_controller.dart';
// import 'package:hamour/views/components/home_screen/widgets/custome_input.dart';

// class AddressDetailsScreen extends StatelessWidget {
//   const AddressDetailsScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     // final addAddressDetailsController =
//     Get.put<AddAddressDetailsController>(AddAddressDetailsController());
//     return Form(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Text(
//             "customerInfo".tr,
//           ),
//           // Text("${placemarks[0].street}"),
//           const SizedBox(height: 10),
//           const CustomInput(
//               labelText: "customerName", hintText: "enterCustomerName"),
//           // const SizedBox(height: 10),
//           const CustomInput(
//               labelText: "phoneNumber", hintText: "contactNumber"),
//           const CustomInput(
//               labelText: "street", hintText: "enterStreet"),
//           const CustomInput(
//               labelText: "moreDetails", hintText: "enterMoreDetails"),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/home/address/add_address_details_controller.dart';
import 'package:hamour/core/classes/data_view_hander.dart';
import 'package:hamour/views/components/home_screen/address/address_form.dart';
import 'package:hamour/views/components/home_screen/cart/top_bar.dart';
import 'package:hamour/views/components/home_screen/widgets/custom_button.dart';

class AddressDetailsScreen extends StatelessWidget {
  AddressDetailsScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put<AddAddressDetailsController>(AddAddressDetailsController());
    return Scaffold(
      body: ListView(
        // shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: 80,
            child: TopBar(
              title: 'address',
              icon: Icons.location_on_rounded,
              leftIconString: "chooseLocation",
              onPressed: () {},
            ),
          ),
          GetBuilder<AddAddressDetailsController>(
            builder: (addAddressController) => DataRequestHandler(
              statusRequest: addAddressController.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - 100,
                  child: ListView(
                    children: [
                      AddressForm(formKey: formKey),
                      CustomButton(
                        onTap: () {
                          if (formKey.currentState != null &&
                              formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            addAddressController.onNext();
                          }
                        },
                        width: MediaQuery.of(context).size.width - 100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
