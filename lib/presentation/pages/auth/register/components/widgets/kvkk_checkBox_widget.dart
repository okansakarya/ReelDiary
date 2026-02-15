import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class KvkkCheckboxWidget extends StatelessWidget {
  const KvkkCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textPrim = AppColors.textPrimary(context);
    final primary = AppColors.primary(context);
    return Text.rich(
      TextSpan(
        text: 'Devam ederek, ',
        style: TextStyle(color: textPrim, fontSize: 15),
        children: [
          TextSpan(
            text: 'kullanım şartları\n',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 've gizlilik politikasını kabul\n',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: primary,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: 'etmiş olursunuz.',
            style: TextStyle(color: textPrim, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
