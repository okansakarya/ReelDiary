import 'package:flutter/material.dart';

/// Değişecekler...
class AppColors {
  /// ----------------- ÖZEL RENKLER -------------------------

  // ------------------------ Light Theme -------------------------
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFF5F5F5);
  static const Color lightText = Color(0xFF1A1A1A);

  // ------------------------ Dark Theme -------------------------
  static const Color backgroundDark = Color(0xFF090909);
  static const Color surfaceDark = Color(0xFF2D2D2D);

  // ------------------------ General Color -------------------------
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textMini = Color(0x80FFFFFF);
  static const Color inputBackground = Color(0x1AFFFFFF);
  static const Color inputBorder = Color(0x33FFFFFF);
  static const Color primaryRed = Color(0xFFE50914);
  static const Color primaryGreen = Color.fromARGB(255, 9, 229, 104);
  //static const Color textColor = Color(0xFFB47B48);
  static const Color newScaffoldBackground = Color(0xFFD0E0CB);
  static final Color morrenk = Color(0x803C34BF).withOpacity(0.1);
  static final Color welcomeColor = Color(0xFF6F61);
  static const Color buttonAndText = Color(0xFFFF6F61);
  // %75 opak
  ///
  static const Color welcomeCircleColor = Color(
    0xBF1A3C34,
  ); // opak ve canlı yeşil
  static const Color customTextFieldColors = Color(0xFF000000);

  /// login ve register da kullanılan buton rengi
  static const Color buttonColor = Color(0xFFB47B48);

  /// tüm sayfaların scaffold rengi
  static const Color scaffoldBackgroundColor = Color(0xFFF6F6F6);

  /// login ve registerdaki Header kısmındaki text rengi
  static const Color headerText = Color(0xFFB47B48);
  // ------------------------ Welcome Color -------------------------
  static const Color cosvinciText = Color(0xFFB47B48);

  static const Color BorderColor = Color(0xFFB47B48);

  // ------------------------ Register Color -------------------------
  static const Color registerText = Color.fromARGB(221, 213, 142, 44);
  static const Color kvkkTextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color kvkkimportant = Color(0xFF2196F3);

  // ------------------------ Login Color -------------------------
  // static const Color appBarBackgroundColor = Color(0xFFFFFF);
  static const Color appBarBackgroundColor = Color(0xFFFDF7F2);
  static final Color dividerColor = const Color(
    0xFFB07B4B,
  ).withValues(alpha: 0.3);

  /// --- veya ---  ==> veya texti için
  static final Color dividerText = const Color(
    0xFFB07B4B,
  ).withValues(alpha: 0.7);
  static const Color googleTextColor = Color(0xFFB47B48);
  // ------------------------ Pop up Color -------------------------
  static const Color errorBackgroundColor = Color.fromARGB(255, 185, 30, 30);
  static const Color foregroundColor = Colors.white;
  static const Color successBackgroundColor = Color(0x15B50D);

  /// Genel renkler
  static const Color textColor = const Color(0xFF1A3C34);
  static const Color primaryColor = const Color(0xFFFF6F61);
}
