import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class CustomTextFieldWidget extends StatefulWidget {
  CustomTextFieldWidget({
    required this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.validator,
    this.controller,
    this.onChanged,
    this.backgroundColor = const Color(0xFFFDF7F2),
    this.iconColor = AppColors.customTextFieldColors,
    this.textColor = AppColors.customTextFieldColors,
    this.labelColor = Colors.white,
    //burdaki sabitler appcolordan gelmeli
    this.borderColor = const Color(0xFFE0C9B0),
    this.togglePassword, // 👈 yeni eklendi
    this.isVisible = true, // 👈 yeni eklendi
    super.key,
  });

  /// Label üst başlık (örn: "Ad Soyad")
  final String label;

  /// TextField içindeki placeholder (örn: "Adınızı ve soyadınızı girin")
  final String hintText;

  /// TextField içindeki ikon
  final IconData icon;

  /// Şifre mi değil mi
  final bool isPassword;

  /// Controller (dışarıdan gönderilebilir)
  final TextEditingController? controller;

  /// OnChanged callback
  final ValueChanged<String>? onChanged;

  /// Arka plan rengi
  final Color backgroundColor;

  /// İkon rengi
  final Color iconColor;

  /// Yazı rengi
  final Color textColor;

  /// Border rengi
  final Color borderColor;

  ///label color field üstüdndeki ksıım
  final Color labelColor;

  ///validate callback
  final String? Function(String?)? validator;

  /// toggle password
  final VoidCallback? togglePassword;

  /// ŞİFRE GÖRÜNÜRLLÜĞÜ
  final bool isVisible;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextFieldWidget> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: TextStyle(
            color: widget.labelColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.01),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isPassword && !isVisible,
          onChanged: widget.onChanged,
          style: TextStyle(color: widget.textColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.backgroundColor,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: widget.textColor.withValues(alpha: 0.5)),
            prefixIcon: Icon(widget.icon, color: widget.iconColor),
            suffixIcon:  widget.isPassword ? IconButton(
                    icon: Icon(
                      isVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: widget.iconColor,
                    ),
                    onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                  ) : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: widget.iconColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
