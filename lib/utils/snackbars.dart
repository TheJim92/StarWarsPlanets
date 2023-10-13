import 'package:flutter/material.dart';

import '../theme/res/color_set.dart';

class SnackBars {
  static void showSnackBar(String message, BuildContext context) {
    var snackBar =  SnackBar(

      backgroundColor: Colors.black.withAlpha(128),
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: AppColor.secondary, width: 2),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
      ),
      content: const Text("Nome utente o password errati.", textAlign: TextAlign.center,
          style: TextStyle(color: AppColor.secondary)),
    );
    //if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //  }
  }
}