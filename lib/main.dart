import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamour/routes.dart';
import 'bindings/initial_bindings.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'core/themes/hamour_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initailServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalController localController = Get.put(LocalController());
    return GetMaterialApp(
      title: 'Hamour App',
      theme: HamourTheme.light(),
      darkTheme: HamourTheme.dark(),
      translations: HamourTranslations(),
      locale: localController.language,
      themeMode: ThemeMode.dark,
      // initialRoute: '/',
      // initialRoute: AppRoute.onBoarding,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      // routes: routes,
      getPages: routes,
    );
  }
}
