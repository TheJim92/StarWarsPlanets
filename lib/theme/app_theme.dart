import 'package:flutter/material.dart';
import '../../theme/res/color_set.dart';
import '../../theme/res/text_set.dart';
import '../../theme/schemes/app_text_scheme.dart';
import '../../theme/schemes/app_color_scheme.dart';

// Class containing the theme data.
class AppTheme {
  static ThemeData darkTheme() {
    return ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.black,
          actionsIconTheme: const IconThemeData(
            color: AppColor.onSurface,
            size: 24,
          ),
          titleTextStyle:
          AppTextTheme.bodyText1.copyWith(color: AppColor.onSurface),
          iconTheme: const IconThemeData(
            color: AppColor.onSurface,
            size: 24,
          ),
        ),
        primaryColor: AppColor.primary,
        textTheme: appTextTheme,
        fontFamily: 'Manrope',
        colorScheme: appColorScheme.copyWith(secondary: AppColor.primary),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                  color: AppColor.primary, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 40)),
              backgroundColor:
              MaterialStateProperty.all(Colors.black.withAlpha(100)),
              shape: MaterialStateProperty.all(const StadiumBorder(
                  side: BorderSide(color: AppColor.primary, width: 2))),
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
        inputDecorationTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: AppColor.secondary),
          focusedBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(style: BorderStyle.solid, color: AppColor.secondary),
          ),
        ),
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColor.secondary,
            selectionColor: AppColor.secondary,
            selectionHandleColor: AppColor.secondary),
        cardTheme: CardTheme(
          surfaceTintColor: Colors.transparent,
            color: AppColor.secondary.withAlpha(100),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: AppColor.secondary,width: 1),
          )
        )
    );
  }
}
