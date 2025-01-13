import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.hintText,
    required this.labelText,
    this.icon,
    this.controller,
    this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.onIconPressed,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
  });
  final String hintText;
  final String labelText;
  final IconData? icon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onIconPressed;
  final FloatingLabelBehavior? floatingLabelBehavior;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
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
              labelText: labelText.tr,
              labelStyle: Theme.of(context).textTheme.bodyMedium,
              hintText: hintText.tr,
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelBehavior: floatingLabelBehavior,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 1)
                      .copyWith(bottom: 10),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
