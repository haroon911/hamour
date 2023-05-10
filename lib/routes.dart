import 'package:get/get.dart';
import 'package:hamour/views/screens/auth/forgot_password/reset_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/verification.dart';
import 'package:hamour/views/screens/auth/signup/supplier_signup.dart';
import 'package:hamour/views/screens/auth/verification_succuss.dart';
import 'package:hamour/views/screens/home_screen/home_screen.dart';
import 'package:hamour/views/screens/home_screen/home/products_cat/product_cat_screen.dart';

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
  GetPage(name: AppRoutes.login, page: () => LoginScreen()),
  GetPage(name: AppRoutes.signUp, page: () => SignUp()),
  GetPage(
      name: AppRoutes.forgotPasswordScreen, page: () => ForgotPasswordScreen()),
  GetPage(
      name: AppRoutes.supplierSignUpScreen, page: () => SupplierSignUpSceen()),
  GetPage(
      name: AppRoutes.resetVerificationScreen,
      page: () => ResetVerificationScreen()),
  GetPage(
      name: AppRoutes.resetPasswordScreen, page: () => ResetPasswordScreen()),
  GetPage(
      name: AppRoutes.signupVerificationScreen,
      page: () => SignUpVerificationScreen()),
  GetPage(
      name: AppRoutes.verificationSuccess, page: () => VerificationSuccess()),
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.productsScreen, page: () => const ProductCatScreen()),
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
