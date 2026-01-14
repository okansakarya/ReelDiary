import 'package:flutter/material.dart';

class PopUpUtils {
  static void showPopup(BuildContext context, bool success,{required String successMessage, required String failureMessage}) {
    if(context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: success
              ? Text(successMessage)
              : Text(failureMessage),
          backgroundColor: success ? Colors.green : Colors.red,
        ),
      );
    }
  }
}
