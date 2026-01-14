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

    // ✅ CineTrack / dark-glass defaults
    this.backgroundColor = AppColors.textFieldFill,      // glass fill
    this.iconColor = AppColors.textFieldIcon,            // icon
    this.textColor = AppColors.textFieldText,            // input text
    this.labelColor = AppColors.textFieldLabel,          // label
    this.borderColor = AppColors.textFieldBorder,        // border

    this.togglePassword,
    this.isVisible = true,
    super.key,
  });

  final String label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  final Color borderColor;
  final Color labelColor;

  final String? Function(String?)? validator;
  final VoidCallback? togglePassword;
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
            hintStyle: TextStyle(color: widget.textColor.withValues(alpha: 0.45)),
            prefixIcon: Icon(widget.icon, color: widget.iconColor),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: widget.iconColor,
              ),
              onPressed: () {
                setState(() => isVisible = !isVisible);
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: widget.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              // ✅ focus: primary
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
