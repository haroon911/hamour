import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({super.key, this.onSubmit});
  final void Function(String)? onSubmit;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        focusedBorderColor: Theme.of(context).primaryColor,
        numberOfFields: 5,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 5,
        // filled: true,
        // borderColor: const Color(0xFF512DA8),
        // borderColor: Theme.of(context).primaryColor,
        //set to true to show as box or false to show as dash
        showFieldAsBox: false,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: const Text("Verification Code"),
          //       content: Text('Code entered is $verificationCode'),
          //     );
          //   },
          // );
        }, // end onSubmit
      ),
    );
  }
}
