import 'package:flutter/material.dart';
import '../../theme/res/text_set.dart';

/// Costante di definizione del TextTheme dell'app
/// il TextTheme definisce degli stili per vari tipi di testo
/// non fa puntamento diretto ai testi dei widget, si limita a
/// generare degli stili generici, che vanno poi applicati
/// maggiori riferimenti nella documentazione ufficiale:
///
///
/// link di riferimento alla documentazione: https://api.flutter.dev/flutter/material/ColorScheme-class.html
// Si ostina a riportare i riferimenti alla documentazione per invoglia a uno studio del framework
// preciso secondo quanto illistrato da Google (owner di Flutter)
// diffidate da tutorial non ufficiali e di stakoverflow, SOTTOLINEO STACKOVERFLOW
const appTextTheme = TextTheme(
  displayLarge: AppTextTheme.headline1,
  displayMedium: AppTextTheme.headline2,
  titleMedium: AppTextTheme.subtitle1,
  titleSmall: AppTextTheme.subtitle2,
  bodyLarge: AppTextTheme.bodyText1,
  bodyMedium: AppTextTheme.bodyText2,
  labelLarge: AppTextTheme.button,
  bodySmall: AppTextTheme.caption,
  labelSmall: AppTextTheme.overline,
  labelMedium: AppTextTheme.caption,
);