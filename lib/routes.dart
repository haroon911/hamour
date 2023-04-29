import 'package:get/get.dart';
import 'package:hamour/views/screens/auth/forgot_password/reset_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/verification.dart';
import 'package:hamour/views/screens/auth/signup/supplier_signup.dart';
import 'package:hamour/views/screens/auth/verification_succuss.dart';
import 'package:hamour/views/screens/home/store_home.dart';

import 'core/constants/route_names.dart';
import 'core/middleware/hamour_middleware.dart';
import 'views/screens/auth/login/login.dart';
import 'views/screens/auth/signup/signup.dart';
import 'views/screens/auth/forgot_password/forgot_password.dart';
import 'views/screens/auth/signup/signup_verification.dart';
import 'views/screens/onboarding/onboarding_screen.dart';

// final Map<String, Widget Function(BuildContext)> routess = {
//   AppRoute.onBoarding: (context) => OnBoardingScreen(),
//   AppRoute.login: (context) => LoginScreen(),
//   AppRoute.signUp: (context) => SignUp(),
//   AppRoute.forgotPasswordScreen: (context) => ForgotPasswordScreen(),
//   AppRoute.supplierSignUpScreen: (context) => SupplierSignUpSceen(),
//   AppRoute.resetVerificationScreen: (context) => ResetVerificationScreen(),
//   AppRoute.resetPasswordScreen: (context) => ResetPasswordScreen(),
//   AppRoute.signupVerificationScreen: (context) => SignUpVerificationScreen(),
//   AppRoute.verificationSuccess: (context) => VerificationSuccess(),
// };

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => OnBoardingScreen(),
      // name: "/",
      // page: () => const TestView(),
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
  GetPage(
      name: AppRoute.storeHomePage, page: () =>const  StoreHomePage()),
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
