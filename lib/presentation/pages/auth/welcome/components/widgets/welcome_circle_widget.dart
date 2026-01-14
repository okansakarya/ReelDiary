import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class WelcomCircleWidget extends StatelessWidget {
  const WelcomCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                  width: ScreenUtils.getScreenWidth(context) * 0.6,
                  height:
                      ScreenUtils.getScreenWidth(context) *
                      0.6, // circle için height = width
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.welcomeCircleColor, // şeffaf renk
                  ),
                  child: const Center(
                    child: Text(
                      'COSVİNCİ',
                      style: TextStyle(
                        color: Colors.white, // kontrast renk seç
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
  }
}