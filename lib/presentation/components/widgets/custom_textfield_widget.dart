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

    this.backgroundColor,
    this.iconColor,
    this.textColor,
    this.labelColor,
    this.borderColor,
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

  final Color? backgroundColor;
  final Color? iconColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? labelColor;

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
    final bg = widget.backgroundColor ?? AppColors.textFieldFill(context);
    final icon = widget.iconColor ?? AppColors.textFieldIcon(context);
    final text = widget.textColor ?? AppColors.textFieldText(context);
    final label = widget.labelColor ?? AppColors.textFieldLabel(context);
    final border = widget.borderColor ?? AppColors.textFieldBorder(context);
    final primary = AppColors.primary(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: label,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.01),
        TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isPassword && !isVisible,
          onChanged: widget.onChanged,
          style: TextStyle(color: text),
          decoration: InputDecoration(
            filled: true,
            fillColor: bg,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: text.withValues(alpha: 0.45)),
            prefixIcon: Icon(widget.icon, color: icon),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: icon,
              ),
              onPressed: () {
                setState(() => isVisible = !isVisible);
              },
            )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primary, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
