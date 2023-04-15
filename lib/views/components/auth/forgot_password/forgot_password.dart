import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/auth/login_controller.dart';

import '../../../../core/functions/input_validation.dart';
import '../Widgets/auth_text_form.dart';

class ForgotPasswordForm extends GetView<LoginController> {
  const ForgotPasswordForm({super.key, this.formKey});
  final GlobalKey? formKey;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Form(
        key: formKey,
        child: AuthTextFormField(
          labelText: 'email',
          hintText: 'emailText',
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          icon: Icons.email_outlined,
          validator: (value) => emailInputValidator(value!),
          onSaved: (newValue) => controller.emailController.text = newValue!,
        ),
      ),
    );
  }
}
