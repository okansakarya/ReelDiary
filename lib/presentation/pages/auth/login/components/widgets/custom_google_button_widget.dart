import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/components/widgets/custom_elevated_button_widget.dart';

class CustomGoogleButtonWidget extends StatelessWidget {
  const CustomGoogleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButtonWidget(
      border: const BorderSide(color: AppColors.primaryColor),
      onPressed: () {},
      backgroundColor: Colors.white,
      child: const Text(
        'Google ile giriş yap',
        style: TextStyle(
          color: Color(0xFF0F172A), // okunaklı koyu text
          fontSize: 18,
        ),
      ),
    );
  }
}
