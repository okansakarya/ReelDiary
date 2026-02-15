import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class FilterCardWidget extends StatelessWidget {
  const FilterCardWidget({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final backgroundColor =
        isSelected ? AppColors.primary(context) : AppColors.surfaceVariant(context);
    final textColor = isSelected
        ? colorScheme.onPrimary
        : AppColors.textPrimary(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
