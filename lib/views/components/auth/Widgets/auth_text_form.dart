import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthTextFormField extends StatelessWidget {
  const AuthTextFormField(
      {super.key,
      required this.hintText,
      required this.labelText,
      this.controller,
      this.icon,
      this.onSaved,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onChanged, this.onIconPressed});

  final String hintText;
  final String labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onIconPressed;

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: Theme.of(context).primaryColor),
        gapPadding: 20);
    return Container(
      margin: const EdgeInsets.only(top: 18),
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        onSaved: (newValue) => onSaved,
        onChanged: onChanged,
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText.tr,
          hintText: hintText.tr,
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: onIconPressed,
              icon: Icon(
                icon,
                size: 25,
              ),
            ),
          ),
          //hamour style
          labelStyle: const TextStyle(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder.copyWith(gapPadding: 10),
          errorBorder: const OutlineInputBorder().copyWith(
            borderRadius: BorderRadius.circular(28),
            gapPadding: 20,
            borderSide: const BorderSide(color: Colors.redAccent),
          ),
          focusedErrorBorder: outlineInputBorder.copyWith(
              borderRadius: BorderRadius.circular(28),
              gapPadding: 20,
              borderSide: const BorderSide(color: Colors.redAccent)),
        ),
      ),
    );
  }
}
// bool isPassword(TextInputType keyboardType){
//   if(keyboardType== TextInputType.visiblePassword)
//   {return true;}
//   else {
//     return false;
//   }
// }


