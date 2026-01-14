import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class ThemeConfig {
  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: 'EuclidCircularA',
        bodyColor: AppColors.textColor,
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(Color(0xFFD0E0CB)),
        thickness: WidgetStatePropertyAll(6),
        radius: Radius.circular(10),
      ),
    );
  }

  static ThemeData get darkTheme {
    final base = ThemeData.dark();
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: 'EuclidCircularA',
          bodyColor: AppColors.textColor
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(Color(0xFFD0E0CB)),
        thickness: WidgetStatePropertyAll(6),
        radius: Radius.circular(10),
      ),
    );
  }
}
