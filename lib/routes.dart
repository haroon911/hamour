import 'package:flutter/material.dart';
import 'package:hamour/views/screens/auth/forgot_password/reset_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/verification.dart';
import 'package:hamour/views/screens/auth/signup/supplier_signup.dart';

import 'core/constants/route_names.dart';
import 'views/screens/auth/login/login.dart';
import 'views/screens/auth/signup/signup.dart';
import 'views/screens/auth/forgot_password/forgot_password.dart';
import 'views/screens/auth/signup/signup_verification.dart';
import 'views/screens/onboarding/onboarding_screen.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.onBoarding: (context) => OnBoardingScreen(),
  AppRoute.login: (context) => LoginScreen(),
  AppRoute.signUp: (context) => SignUp(),
  AppRoute.forgotPasswordScreen: (context) => ForgotPasswordScreen(),
  AppRoute.supplierSignUpScreen: (context) => SupplierSignUpSceen(),
  AppRoute.verificationScreen: (context) => ResetVerificationScreen(),
  AppRoute.resetPasswordScreen: (context) => ResetPasswordScreen(),
  AppRoute.signupVerificationScreen: (context) => SignUpVerificationScreen(),
};
























// List<GetPage<dynamic>> routes = [
//   GetPage(
//     name: AppRoute.login,
//     page: () => LoginPage(),
//   ),
//   GetPage(
//     name: AppRoute.homePage,
//     page: () => const HomePage(),
//   ),
// ];
