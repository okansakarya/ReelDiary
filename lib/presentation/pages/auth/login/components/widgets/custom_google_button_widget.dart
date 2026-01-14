import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_elevated_button_widget.dart';

class CustomGoogleButtonWidget extends StatelessWidget {
  const CustomGoogleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
      border: BorderSide(color: AppColors.dividerColor),
      onPressed: () {},
      backgroundColor: Colors.white,
      child: const Text(
        'Google ile giriş yap',
        style: TextStyle(
          color: AppColors.googleTextColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
