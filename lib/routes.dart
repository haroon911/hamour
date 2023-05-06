import 'package:get/get.dart';
import 'package:hamour/views/screens/auth/forgot_password/reset_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/verification.dart';
import 'package:hamour/views/screens/auth/signup/supplier_signup.dart';
import 'package:hamour/views/screens/auth/verification_succuss.dart';
import 'package:hamour/views/screens/home/home_screen.dart';

import 'core/constants/app_routes_names.dart';
import 'core/middleware/hamour_middleware.dart';
import 'views/screens/auth/login/login.dart';
import 'views/screens/auth/signup/signup.dart';
import 'views/screens/auth/forgot_password/forgot_password.dart';
import 'views/screens/auth/signup/signup_verification.dart';
import 'views/screens/onboarding/onboarding_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => OnBoardingScreen(),
      middlewares: [HamourMiddleware()]),
  GetPage(name: AppRoute.login, page: () => LoginScreen()),
  GetPage(name: AppRoute.signUp, page: () => SignUp()),
  GetPage(
      name: AppRoute.forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  GetPage(
      name: AppRoute.supplierSignUpScreen, page: () => SupplierSignUpSceen()),
  GetPage(
      name: AppRoute.resetVerificationScreen,
      page: () => ResetVerificationScreen()),
  GetPage(
      name: AppRoute.resetPasswordScreen, page: () => ResetPasswordScreen()),
  GetPage(
      name: AppRoute.signupVerificationScreen,
      page: () => SignUpVerificationScreen()),
  GetPage(
      name: AppRoute.verificationSuccess, page: () => VerificationSuccess()),
  GetPage(name: AppRoute.homePage, page: () => const HomeScreen()),
  // GetPage(name: AppRoute.dashBoard, page: () => const DashBoard()),
];
























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
