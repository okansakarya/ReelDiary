import 'package:flutter/material.dart';
import 'package:movieapp/utils/screen_utils.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  final BorderSide? border;
  final VoidCallback? onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final Image? image;

  const CustomElevatedButtonWidget({
    this.border,
    this.foregroundColor = Colors.white,
    this.image,
    required this.onPressed,
    required this.backgroundColor,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ScreenUtils.getScreenWidth(context)*0.8,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: border,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          // Yazı rengi
          padding: const EdgeInsets.symmetric(vertical: 16),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
