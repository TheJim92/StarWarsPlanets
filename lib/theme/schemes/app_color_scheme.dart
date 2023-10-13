import 'package:flutter/material.dart';
import '../../theme/res/color_set.dart';


/// Costante di definizione del ColorScheme dell'app
/// proprità aggiunta con la versione 2.1 di flutter
/// il ColorScheme agisce sui principali colori usati
/// all'interno dell'app. I vecchi metodi utilizzati
/// saranno presto deprecati.
/// Color scheme sarà l'unica sorgete di informazione
/// per i colori dei widget principali dell'app
///
/// link di riferimento alla documentazione nel dettaglio: https://api.flutter.dev/flutter/material/ColorScheme-class.html
const ColorScheme appColorScheme = ColorScheme(
  /*
    i nomi dei colori della classe AppColor (file: res/color_set)
    sono stati scelti appositamente per fare riferimento alla relativa property di ColorScheme
    non avendo ritenuto opportuno la generazione di varianti,
    ai relativi colorVariant è stato assegnato il valore color principale
    es:
    - primary: AppColor.primary
    - primaryVariant: AppColor.primary,

   */
  /// Domanda: Perchè definire un variant se è uguale al principale?
  /// Risposta: alcune proprietà dei colorScheme (tra cui le colorVariant) sono required,
  /// per cui è necessario definire almeno tutte quelle che sono riportate all'interno di questa const
  // Trovate maggiori dettagli a questa risposta nella documentazione
  /// [Always remember: official documentation is better]
  primary: AppColor.primary,
  secondary: AppColor.secondary,
  surface: AppColor.surface,
  background: AppColor.background,
  error: AppColor.error,
  onPrimary: AppColor.onPrimary,
  onSecondary: AppColor.onSecondary,
  onSurface: AppColor.onSurface,
  onBackground: AppColor.onSecondary,
  onError: AppColor.onError,
  brightness: Brightness.light,
);

