import 'package:flutter/material.dart';

/// Dark/Light palet ile aynı renkler (AppColors ile uyumlu).
class _Palette {
  static const Color darkSurface = Color(0xFF1B262C);
  static const Color darkSurfaceVariant = Color(0xFF0F4C75);
  static const Color darkPrimary = Color(0xFF3282B8);
  static const Color darkSecondary = Color(0xFF0F4C75);
  static const Color darkTextPrimary = Color(0xFFBBE1FA);
  static const Color darkOnPrimary = Color(0xFF1B262C);

  static const Color lightSurface = Color(0xFFE3FDFD);
  static const Color lightSurfaceVariant = Color(0xFFCBF1F5);
  static const Color lightPrimary = Color(0xFF71C9CE);
  static const Color lightSecondary = Color(0xFFA6E3E9);
  static const Color lightTextPrimary = Color(0xFF1B262C);
  static const Color lightOnPrimary = Color(0xFF1B262C);
}

class ThemeConfig {
  static const _font = 'EuclidCircularA';

  static ThemeData get lightTheme {
    const scheme = ColorScheme.light(
      primary: _Palette.lightPrimary,
      onPrimary: _Palette.lightOnPrimary,
      secondary: _Palette.lightSecondary,
      onSecondary: _Palette.lightTextPrimary,
      surface: _Palette.lightSurface,
      onSurface: _Palette.lightTextPrimary,
      surfaceContainerHighest: _Palette.lightSurfaceVariant,
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
    );
    final base = ThemeData.light().copyWith(colorScheme: scheme);
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: _font,
        bodyColor: _Palette.lightTextPrimary,
        displayColor: _Palette.lightTextPrimary,
      ),
      scaffoldBackgroundColor: _Palette.lightSurface,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(_Palette.lightPrimary),
        thickness: const WidgetStatePropertyAll(6),
        radius: const Radius.circular(10),
      ),
    );
  }

  static ThemeData get darkTheme {
    const scheme = ColorScheme.dark(
      primary: _Palette.darkPrimary,
      onPrimary: _Palette.darkTextPrimary,
      secondary: _Palette.darkSecondary,
      onSecondary: _Palette.darkTextPrimary,
      surface: _Palette.darkSurface,
      onSurface: _Palette.darkTextPrimary,
      surfaceContainerHighest: _Palette.darkSurfaceVariant,
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
    );
    final base = ThemeData.dark().copyWith(colorScheme: scheme);
    return base.copyWith(
      textTheme: base.textTheme.apply(
        fontFamily: _font,
        bodyColor: _Palette.darkTextPrimary,
        displayColor: _Palette.darkTextPrimary,
      ),
      scaffoldBackgroundColor: _Palette.darkSurface,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: WidgetStatePropertyAll(_Palette.darkPrimary),
        thickness: const WidgetStatePropertyAll(6),
        radius: const Radius.circular(10),
      ),
    );
  }
}
