import 'package:flutter/material.dart';

/// Dark / Light tema paletleri. Erişim: AppColors.primary(context) vb.
class AppColors {
  AppColors._();

  // ----- Dark tema (#1B262C, #0F4C75, #3282B8, #BBE1FA)
  static const Color _darkSurface = Color(0xFF1B262C);
  static const Color _darkSurfaceVariant = Color(0xFF0F4C75);
  static const Color _darkPrimary = Color(0xFF3282B8);
  static const Color _darkSecondary = Color(0xFF0F4C75);
  static const Color _darkTextPrimary = Color(0xFFBBE1FA);
  static const Color _darkTextSecondary = Color(0xCCBBE1FA);

  // ----- Light tema (#E3FDFD, #CBF1F5, #A6E3E9, #71C9CE, #1B262C)
  static const Color _lightSurface = Color(0xFFE3FDFD);
  static const Color _lightSurfaceVariant = Color(0xFFCBF1F5);
  static const Color _lightPrimary = Color(0xFF71C9CE);
  static const Color _lightSecondary = Color(0xFFA6E3E9);
  static const Color _lightTextPrimary = Color(0xFF1B262C);
  static const Color _lightTextSecondary = Color(0x991B262C);

  static bool _isDark(BuildContext c) =>
      Theme.of(c).brightness == Brightness.dark;

  static Color surface(BuildContext c) =>
      _isDark(c) ? _darkSurface : _lightSurface;

  static Color surfaceVariant(BuildContext c) =>
      _isDark(c) ? _darkSurfaceVariant : _lightSurfaceVariant;

  static Color primary(BuildContext c) =>
      _isDark(c) ? _darkPrimary : _lightPrimary;

  static Color secondary(BuildContext c) =>
      _isDark(c) ? _darkSecondary : _lightSecondary;

  static Color textPrimary(BuildContext c) =>
      _isDark(c) ? _darkTextPrimary : _lightTextPrimary;

  static Color textSecondary(BuildContext c) =>
      _isDark(c) ? _darkTextSecondary : _lightTextSecondary;

  // TextField (tema-farkında; textPrimary tabanlı alpha)
  static Color textFieldText(BuildContext c) => textPrimary(c);
  static Color textFieldFill(BuildContext c) =>
      textPrimary(c).withValues(alpha: 0.06);
  static Color textFieldBorder(BuildContext c) =>
      textPrimary(c).withValues(alpha: 0.12);
  static Color textFieldIcon(BuildContext c) =>
      textPrimary(c).withValues(alpha: 0.6);
  static Color textFieldLabel(BuildContext c) =>
      textPrimary(c).withValues(alpha: 0.85);
}
