import 'package:flutter/material.dart';

import '../theme/res/color_set.dart';

// SnackBars to show error or success messages
class SnackBars {
  static void showSnackBar(String message, BuildContext context) {
    var snackBar =  SnackBar(
      backgroundColor: Colors.black.withAlpha(128),
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColor.secondary, width: 2),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      content: Text(message, textAlign: TextAlign.center,
          style: const TextStyle(color: AppColor.secondary)),
    );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}