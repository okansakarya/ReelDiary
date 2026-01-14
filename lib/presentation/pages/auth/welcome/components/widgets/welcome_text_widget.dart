import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Ortaya hizalama
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Cildin ',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.buttonAndText,
                  fontWeight: FontWeight.w500,
                  // height: 36,
                ),
              ),
              TextSpan(
                text: 'için doğruyu öğren,',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4), // satır aralığı
        const Text(
          'içeriği tanı',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
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
                  color: AppColors.buttonAndText,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextSpan(
                text: 'kullan!',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
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
