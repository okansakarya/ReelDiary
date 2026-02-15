import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary(context);
    final text = AppColors.textPrimary(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Cildin ',
                style: TextStyle(
                  fontSize: 16,
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'için doğruyu öğren,',
                style: TextStyle(
                  fontSize: 16,
                  color: text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          'içeriği tanı',
          style: TextStyle(
            fontSize: 16,
            color: text,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'güvenle ',
                style: TextStyle(
                  fontSize: 16,
                  color: primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(
                text: 'kullan!',
                style: TextStyle(
                  fontSize: 16,
                  color: text,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
