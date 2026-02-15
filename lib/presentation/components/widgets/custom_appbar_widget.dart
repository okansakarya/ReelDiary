import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final surfaceVariant = AppColors.surfaceVariant(context);
    final borderColor = AppColors.primary(context).withValues(alpha: 0.25);

    return Container(
      decoration: BoxDecoration(
        color: surfaceVariant,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        border: Border(
          bottom: BorderSide(color: borderColor, width: 2),
        ),
      ),
      child: child,
    );
  }
}
