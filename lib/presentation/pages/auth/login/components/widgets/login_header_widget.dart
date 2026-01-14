import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtils.getScreenHeight(context) * 0.03,
        vertical: ScreenUtils.getScreenWidth(context) * 0.04,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Giriş Yap',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.03),
              const Text(
                "ReelDiary'e hoş geldiniz",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
