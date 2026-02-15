import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class CustomDifferentLoginTypeButton extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final VoidCallback onPressed;

  // Opsiyonel: butonu pasifleştirmek istersen
  final bool enabled;

  const CustomDifferentLoginTypeButton({
    required this.buttonIcon,
    required this.buttonText,
    required this.onPressed,
    this.enabled = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(14);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: radius,
        onTap: enabled ? onPressed : null,
        child: Ink(
          width: ScreenUtils.getScreenWidth(context)*0.6,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.secondary(context).withValues(alpha: 0.6),
            borderRadius: radius,
            border: Border.all(color: AppColors.primary(context), width: 1),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: const Offset(0, 4),
                color: AppColors.surface(context).withValues(alpha: 0.08),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                buttonIcon,
                color: AppColors.textPrimary(context),
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                buttonText,
                style: TextStyle(
                  color: AppColors.textPrimary(context),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
