import 'package:flutter/material.dart';

class ScreenUtils {

  /// Ekran genişliğini döndüren fonksiyon
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Ekran yüksekliğini döndüren fonksiyon
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  /// Horizontal padding için standart değer döndürür
  static double getHorizontalPadding(BuildContext context) {
    return 20.0; // 5 * 4 = 20px (HTML'de px-5)
  }

}