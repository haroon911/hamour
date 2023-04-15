import 'package:flutter/material.dart';

import '../constants/colors.dart';

class HamourTheme {
  static TextTheme lightTextTheme = _commonTextTheme(color: Colors.black);
  static TextTheme darkTextTheme = _commonTextTheme(color: Colors.white);
  Color color = const Color.fromARGB(
      255, 48, 96, 172); //this is like the secondary light color
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.light(
        onSurfaceVariant: AppColor.secondaryLightColor.withOpacity(0.9),
        primary: AppColor.secondaryLightColor,
        surfaceTint: AppColor.primaryLightColor,
        // onSurface: Colors.red,
        tertiaryContainer: Colors.red,
      ),

      // inputDecorationTheme: inputDecorationTheme(AppColor.secondaryLightColor),
      // inputDecorationTheme: InputDecorationTheme(),
      fontFamily: "Cairo",
      useMaterial3: true,
      brightness: Brightness.light,
      // primaryColor: const Color.fromARGB(255, 233, 146, 47),
      primaryColor: const Color(0xFF1C192B),
      // primaryColor: AppColor.primaryColor,
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) => Colors.black)),
      appBarTheme: AppBarTheme(
        // backgroundColor: Color.fromARGB(255, 239, 140, 26),
        backgroundColor: AppColor.primaryLightColor,
        foregroundColor: Colors.white,
        // backgroundColor: Color(0xFFf4aeff),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.primaryDarkColor,
        foregroundColor: Colors.black,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme:
            // IconThemeData(color: Color.fromARGB(255, 223, 133, 30)),
            IconThemeData(color: AppColor.primaryDarkColor),
      ),
      textTheme: lightTextTheme,
    );
  }

  static ThemeData dark() {
    return ThemeData(
      colorScheme:const ColorScheme.dark().copyWith(
        primary: AppColor.primaryDarkColor,
      ),
      fontFamily: "Cairo",
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryDarkColor,
      checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith(
              (states) => AppColor.primaryDarkColor)),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.primaryDarkColor,
        foregroundColor: const Color(0xFF111111),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 223, 133, 30),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme:
            IconThemeData(color: Color.fromARGB(255, 223, 133, 30)),
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) => Colors.black),
          trackColor: MaterialStateColor.resolveWith(
              (states) => Colors.black.withOpacity(0.5))),
      textTheme: darkTextTheme,
    );
  }
}

TextTheme _commonTextTheme({required Color color}) {
  return TextTheme(
    bodyLarge:
        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: color),
    bodyMedium: TextStyle(
        color: color.withOpacity(0.7),
        fontSize: 20,
        fontWeight: FontWeight.w600),
    displayLarge:
        TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: color),
    displayMedium:
        TextStyle(fontSize: 21.0, fontWeight: FontWeight.w700, color: color),
    displaySmall:
        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color: color),
    titleLarge:
        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600, color: color),
  );
}
