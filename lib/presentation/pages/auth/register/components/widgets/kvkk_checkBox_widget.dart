import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class KvkkCheckboxWidget extends StatelessWidget {
  const KvkkCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'Devam ederek, ',
        style: const TextStyle(color: AppColors.textColor, fontSize: 15),
        children: [
          TextSpan(
            text: 'kullanım şartları\n',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 've gizlilik politikasını kabul\n',
            style: const TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.primaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(
            text: 'etmiş olursunuz.',
            style: TextStyle(color: AppColors.textColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
