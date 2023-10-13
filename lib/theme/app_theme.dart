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
    /*
    La funzione ritorna un ThemeData, oggetto di definizione e di raccolta dello stile generale dell'app
    oltre alle proprietà riportate qui se ne trovano altre. Alcune fanno riferimento diretto a determinate widget
    es:
    - elevatedButtonTheme
    - bottomNavigationBarTheme
    - navigationBarTheme
    - listTileTheme

    è buona pratica definire lo stile di tutti i widget nel ThemeData, anche se i widget possono essere stilizzati singolarmente.
    Utilizzando il ThemeData tutti i componenti ereditano lo stile definito, va da se che per stili di widget che si ripetono nell'app
    è molto comodo definire lo stile una volta e questo automaticamente è recepito dal widget

     */
    // link: https://api.flutter.dev/flutter/material/ThemeData-class.html
    /// Sapete cosa fare ^_^
    return ThemeData(
      scaffoldBackgroundColor: AppColor.background,
        appBarTheme: AppBarTheme(
          // Come suggerito dal nome, qui si definisce lo stile ereditato da tutte le AppBar presenti nell'app
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
