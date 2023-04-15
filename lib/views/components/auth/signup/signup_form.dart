import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controllers/auth/signup_controller.dart';
import '../../../../core/functions/input_validation.dart';
import '../Widgets/auth_text_form.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({super.key, this.formKey});
  final GlobalKey? formKey;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AuthTextFormField(
              labelText: 'storeName',
              hintText: 'storeText',
              controller: controller.storeNameController,
              keyboardType: TextInputType.text,
              icon: Icons.store_rounded,
              validator: (value) => textInputValidator(value!),
              onSaved: (newValue) =>
                  controller.storeNameController.text = newValue!,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  AuthTextFormField(
                    labelText: 'email',
                    hintText: 'emailText',
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email_outlined,
                    validator: (value) => emailInputValidator(value!),
                    onSaved: (newValue) =>
                        controller.emailController.text = newValue!,
                  ),
                  AuthTextFormField(
                    labelText: 'password',
                    hintText: 'passwordText',
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    validator: (value) => passwordInputValidator(value!),
                    onSaved: (newValue) =>
                        controller.passwordController.text = newValue!,
                  ),
                  AuthTextFormField(
                    labelText: 'conformPassword',
                    hintText: 'conformText',
                    controller: controller.conformPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    validator: (value) => confiormInputValidator(
                        value!,
                        controller.passwordController.text,
                        controller.conformPasswordController.text),
                  ),
                  AuthTextFormField(
                    labelText: 'phoneNumber',
                    hintText: 'phoneText',
                    controller: controller.phoneNumberController,
                    keyboardType: TextInputType.phone,
                    icon: Icons.phone_android_rounded,
                    validator: (value) => phoneInputValidator(value!),
                    onSaved: (newValue) =>
                        controller.phoneNumberController.text = newValue!,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
