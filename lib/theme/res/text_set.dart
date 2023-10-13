import 'package:flutter/material.dart';

class AppTextTheme {
  /// Classe di raccolta degli stili dei testi
  /// verranno definiti i TextStyle degli stili di testo
  /// principali usati nell'app

  /// Per riferimenti alla documentazione link: https://api.flutter.dev/flutter/material/TextTheme-class.html
  /// il link riporta i criteri di definizione dei vari stile (headline1, bodyText1, ecc.)
  static const headline1 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w100,
    fontSize: 96,
    letterSpacing: (-1.5),
  );
  static const headline2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w100,
    fontSize: 60,
    letterSpacing: (-0.5),
  );
  static const subtitle1 = TextStyle(
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      color: Color.fromRGBO(118, 118, 118, 1));
  static const subtitle2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.1,
  );
  static const bodyText1 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: Colors.black,
    letterSpacing: 0,
  );
  static const bodyText2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.bold,
    fontSize: 14,
    letterSpacing: 0.25,
  );
  static const button = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    letterSpacing: 1.25,
  );
  static const caption = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    letterSpacing: 0.15,
  );
  static const overline = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w200,
    fontSize: 12,
    letterSpacing: 1,
  );

  static const radioStyle = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: Colors.black,
  );
}
