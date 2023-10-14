import 'package:flutter/material.dart';

import 'color_set.dart';

class AppTextTheme {

  // Class that contains the text styles used in the app
  static const headline1 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w100,
    fontSize: 96,
    letterSpacing: (-1.5),
    color: Colors.white
  );
  static const headline2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w100,
    fontSize: 60,
    letterSpacing: (-0.5),
      color: Colors.white
  );

  // subtitle1 is the textField input
  static const subtitle1 = TextStyle(
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      color: Colors.white);
  static const subtitle2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.1,
      color: Colors.white

  );
  static const bodyText1 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.w300,
    fontSize: 18,
    color: Colors.white,
    letterSpacing: 0,
  );

  // bodyText2 is the card text color
  static const bodyText2 = TextStyle(
    fontFamily: 'Manrope',
    fontWeight: FontWeight.normal,
    fontSize: 14,
    letterSpacing: 0.45,
    color: AppColor.secondary
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
    color: Colors.white,
  );
}
