import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ThemeConfig {
  static const _font = 'EuclidCircularA';

  static ThemeData get lightTheme {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: _font,
        // Light theme'de metin koyu olmalı
        bodyColor: const Color(0xFF0F172A), // slate-900
        displayColor: const Color(0xFF0F172A),
      ),
      // Light theme arkaplanı açık olmalı (AppColors'ta bu değer açık renk olmalı)
      scaffoldBackgroundColor: AppColors.backgroundLight,
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(Color(0xFFD0E0CB)),
        thickness: WidgetStatePropertyAll(6),
        radius: Radius.circular(10),
      ),
    );
  }

  static ThemeData get darkTheme {
    final ThemeData base = ThemeData.dark();

    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: _font,
        // Dark theme'de metin beyaz
        bodyColor: AppColors.textColor,
        displayColor: AppColors.textColor,
      ),
      // Dark theme arkaplanı koyu olmalı (AppColors'ta bu değer koyu renk olmalı)
      scaffoldBackgroundColor: AppColors.backgroundDark,
      scrollbarTheme: const ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(Color(0xFFD0E0CB)),
        thickness: WidgetStatePropertyAll(6),
        radius: Radius.circular(10),
      ),
    );
  }
}
