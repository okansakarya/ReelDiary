import 'package:flutter/material.dart';
import 'package:movieapp/utils/screen_utils.dart';

/// Ana giriş ekranındaki giriş yap ve kayıt ol butonları
class WelcomeButtonWidget extends StatelessWidget {
  /// Welcome button widgetı oluşturur.
  const WelcomeButtonWidget({
    required this.child,
    required this.backgroundColor,
    required this.borderColor,
    this.onPressed,
    super.key,
  });

  /// Dışarıdan Gelecek Widget (Text widget vs )
  final Widget child;

  /// Arka Plan Rengi
  final Color backgroundColor;

  /// Border Rengi
  final Color borderColor;

  /// on pressed fonksiyonu, butona basıldığında alacağı aksiyonu tanımlar
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: ScreenUtils.getScreenWidth(context)/1.2,
        height: ScreenUtils.getScreenHeight(context)/15,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
