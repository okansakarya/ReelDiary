import 'package:flutter/material.dart';

class PopUpUtils {
  static void showPopup(BuildContext context, bool success,{required String successMessage, required String failureMessage}) {
    if(context.mounted) {
      final colorScheme = Theme.of(context).colorScheme;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? successMessage : failureMessage),
          backgroundColor: success ? colorScheme.primary : colorScheme.error,
        ),
      );
    }
  }
}
