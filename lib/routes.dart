import 'package:get/get.dart';
import 'package:hamour/core/constants/app_routes_names.dart';
import 'package:hamour/core/middleware/hamour_middleware.dart';
import 'package:hamour/views/screens/auth/forgot_password/forgot_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/reset_password.dart';
import 'package:hamour/views/screens/auth/forgot_password/verification.dart';
import 'package:hamour/views/screens/auth/login/login.dart';
import 'package:hamour/views/screens/auth/signup/signup.dart';
import 'package:hamour/views/screens/auth/signup/signup_verification.dart';
import 'package:hamour/views/screens/auth/signup/supplier_signup.dart';
import 'package:hamour/views/screens/auth/verification_succuss.dart';
import 'package:hamour/views/screens/home_screen/address/address_details_screen.dart';
import 'package:hamour/views/screens/home_screen/address/address_screen.dart';
import 'package:hamour/views/screens/home_screen/cart/cart_screen.dart';
import 'package:hamour/views/screens/home_screen/checkout/checkout.dart';
import 'package:hamour/views/screens/home_screen/dashboard/dashboard.dart';
import 'package:hamour/views/screens/home_screen/dashboard/wallet.dart';
import 'package:hamour/views/screens/home_screen/home_screen.dart';
import 'package:hamour/views/screens/home_screen/home/products_cat/product_cat_screen.dart';
import 'package:hamour/views/screens/home_screen/order/order_screen.dart';
import 'package:hamour/views/screens/home_screen/products_details.dart';
import 'package:hamour/views/screens/home_screen/repositry_screen.dart';
import 'package:hamour/views/screens/onboarding/onboarding_screen.dart';

import 'views/screens/home_screen/dashboard/customer_details.dart';

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
      name: AppRoutes.verificationSuccess,
      page: () => const VerificationSuccess()),
  GetPage(name: AppRoutes.homePage, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.productsScreen, page: () => const ProductCatScreen()),
  GetPage(name: AppRoutes.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoutes.repositryScreen, page: () => const RepositryScreen()),
  GetPage(name: AppRoutes.dashBoard, page: () => const DashBoard()),
  GetPage(name: AppRoutes.cartScreen, page: () => const CartScreen()),
  GetPage(name: AppRoutes.addressScreen, page: () => const AddressScreen()),
  GetPage(
      name: AppRoutes.addressDetailsScreen, page: () => AddressDetailsScreen()),
  GetPage(name: AppRoutes.checkOutScreen, page: () => const CheckOutScreen()),
  GetPage(name: AppRoutes.walletScreen, page: () => WalletScreen()),
  GetPage(name: AppRoutes.customerDetails, page: () => const CustomerDetails()),
  GetPage(name: AppRoutes.orderScreen, page: () => const OrderScreen()),
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
