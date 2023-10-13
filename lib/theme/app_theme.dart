import 'package:flutter/material.dart';
import '../../theme/res/color_set.dart';
import '../../theme/res/text_set.dart';
import '../../theme/schemes/app_text_scheme.dart';
import '../../theme/schemes/app_color_scheme.dart';

/// Classe di definizione dello stile
/// riporta una funzione statica lightTheme() così nominata perchè definisce
/// lo stile dell'app in lightMode,

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.black,// AppColor.background,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColor.surface,
          actionsIconTheme: const IconThemeData(
            color: AppColor.onSurface,
            size: 24,
          ),
          titleTextStyle: AppTextTheme.bodyText1.copyWith(color: AppColor.onSurface),
          iconTheme: const IconThemeData(
            color: AppColor.onSurface,
            size: 24,
          ),
        ),
        primaryColor: AppColor.primary,
        brightness: Brightness.light,
        textTheme: appTextTheme,
        fontFamily: 'Manrope',
        colorScheme: appColorScheme.copyWith(secondary: AppColor.primary),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(const TextStyle(
                  color: AppColor.surface,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.surface,
                  decorationThickness: 3))),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColor.surface),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: AppColor.onSurface,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          iconColor: MaterialStateProperty.all(AppColor.onSurface),
          iconSize: MaterialStateProperty.all(24),
        )),
        unselectedWidgetColor: AppColor.surface,
    );
  }
}
