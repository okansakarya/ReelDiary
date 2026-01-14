import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class KvkkCheckboxWidget extends StatelessWidget {
  const KvkkCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'Devam ederek, ',
        style: TextStyle(color: Colors.white, fontSize: 15),
        children: [
          TextSpan(
            text: 'kullanım şartları\n',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.buttonAndText,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: 've gizlilik politikasını kabul\n',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: AppColors.buttonAndText,
              fontSize: 15,
            ),
          ),
          TextSpan(
            text: 'etmiş olursunuz.',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
