import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/auth/login_controller.dart';

import '../../../../core/functions/input_validation.dart';
import '../Widgets/auth_text_form.dart';

class LoginForm extends GetView<LoginController> {
  const LoginForm({super.key, this.formKey});
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
          ],
        ),
      ),
    );
  }
}
