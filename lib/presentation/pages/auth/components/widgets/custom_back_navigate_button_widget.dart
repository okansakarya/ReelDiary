import 'package:flutter/material.dart';

class CustomBackNavigateButtonWidget extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;
  final ButtonStyle buttonStyle;
  const CustomBackNavigateButtonWidget({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonStyle,
      onPressed: onPressed, // burada direk parametreyi kullan
      child: icon,
    );
  }
}
