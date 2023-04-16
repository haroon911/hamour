import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/controllers/auth/reset_password_controller.dart';
import '../../../../core/functions/input_validation.dart';
import '../Widgets/auth_text_form.dart';

class ResetPasswordForm extends GetView<ResetPasswordController> {
  const ResetPasswordForm({super.key, this.formKey});
  final GlobalKey? formKey;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                children: [
                  GetBuilder<ResetPasswordController>(builder: (context) {
                    return AuthTextFormField(
                      labelText: 'newPassword',
                      hintText: 'newPasswordText',
                      controller: controller.newPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      icon: Icons.lock_outline_rounded,
                      obscureText: context.obscureText,
                      validator: (value) => passwordInputValidator(value!),
                      onSaved: (newValue) =>
                          controller.newPasswordController.text = newValue!,
                      onIconPressed: () => context.showPassword(),
                    );
                  }),
                  AuthTextFormField(
                    labelText: 'conformPassword',
                    hintText: 'conformText',
                    controller: controller.conformPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    validator: (value) => confiormInputValidator(
                        value!,
                        controller.newPasswordController.text,
                        controller.conformPasswordController.text),
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
