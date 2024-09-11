import 'package:flutter/material.dart';
import 'package:softbenz/view_model/utils/export_utls.dart';

class CustomTheme {
  static ThemeData appTheme() {
    return ThemeData(
        scaffoldBackgroundColor: AppColor.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColor.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColor.black, fontSize: 18, fontWeight: FontWeight.w600),
          shadowColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: AppColor.black,
            size: 20,
          ),
        ),
        fontFamily: "Inter",
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.disabled)) {
                return AppColor.primary1;
              }
              return AppColor.primary;
            },
          ),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColor.white;
            } else {
              return AppColor.black;
            }
          }),
          trackOutlineColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColor.black;
            } else {
              return AppColor.white;
            }
          }),
        ),
        primaryColor: AppColor.primary1,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
            primary: AppColor.primary,
            secondary: AppColor.primary1,
            brightness: Brightness.light),
        textTheme: const TextTheme(
          displaySmall: TextStyle(fontSize: 36, color: AppColor.black),
          bodyLarge: TextStyle(fontSize: 24, color: AppColor.black),
          bodyMedium: TextStyle(fontSize: 22, color: AppColor.black),
          bodySmall: TextStyle(fontSize: 20, color: AppColor.black),
          titleLarge: TextStyle(fontSize: 18, color: AppColor.black),
          titleMedium: TextStyle(fontSize: 16, color: AppColor.black),
          titleSmall: TextStyle(fontSize: 14, color: AppColor.black),
          labelLarge: TextStyle(fontSize: 12, color: AppColor.black),
          labelMedium: TextStyle(fontSize: 11, color: AppColor.black),
          labelSmall: TextStyle(fontSize: 10, color: AppColor.black),
        ),
        splashColor: AppColor.primary);
  }
}
