import 'package:flutter/material.dart';

/// Değişecekler...
class AppColors {

  // Primary accent (logo, active, highlights)
  static const Color primaryColor = Color(0xFFEA2A33);

  // Secondary / surface-dark (cards, nav glass arka planı temeli)
  static const Color secondaryColor = Color(0xFF211111);

  // Main text color on dark UI
  static const Color textColor = Color(0xFFFFFFFF);

  // Primary CTA button (Sign In, Watch Trailer vb.)
  static const Color buttonColor = Color(0xFFEA2A33);

  // (Opsiyonel) Tasarımda sık görünen yardımcı tonlar:
  static const Color backgroundLight = Color(0xFFF8F6F6);
  static const Color backgroundDarkLogin = Color(0xFF211111);
  static const Color backgroundDarkHome = Color(0xFF120A0A); // home html’de var
  static const Color cardDark = Color(0xFF2A1D1D); // details html’de var

  static const Color textMuted = Color(0xFF9CA3AF); // gray-400
  static const Color textSubtle = Color(0xFF6B7280); // gray-500
  static const Color starYellow = Color(0xFFFACC15); // yellow-400

  // Surface colors
  static const Color surfaceDark = Color(0xFF211111); // cards, nav glass background

  static const backgroundDark = Color(0xFF120A0A); // home tasarımına yakın




  // TextField (CineTrack dark-glass) - ✅ const
  static const Color textFieldText  = Color(0xFFFFFFFF);

  // white 6%  => 0x0FFFFFFF  (alpha 15/255 ≈ 0.0588)
  static const Color textFieldFill  = Color(0x0FFFFFFF);

  // white 12% => 0x1FFFFFFF  (alpha 31/255 ≈ 0.1216)
  static const Color textFieldBorder = Color(0x1FFFFFFF);

  // white 60% => 0x99FFFFFF  (alpha 153/255 = 0.6)
  static const Color textFieldIcon  = Color(0x99FFFFFF);

  // white 85% => 0xD9FFFFFF  (alpha 217/255 ≈ 0.85)
  static const Color textFieldLabel = Color(0xD9FFFFFF);




}
