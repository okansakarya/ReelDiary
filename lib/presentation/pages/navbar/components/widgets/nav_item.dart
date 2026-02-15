import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class NavItem extends StatelessWidget {
  const NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isCenter = false,
  });

  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);
    final colorScheme = Theme.of(context).colorScheme;
    final primary = AppColors.primary(context);
    final secondary = AppColors.secondary(context);

    final inactiveColor = AppColors.textSecondary(context);
    final fgColor = isSelected ? colorScheme.onPrimary : inactiveColor;
    final pillRadius = BorderRadius.circular(screenWidth * 0.09);

    const pillDuration = Duration(milliseconds: 150);
    const iconDuration = Duration(milliseconds: 200);
    const textDuration = Duration(milliseconds: 180);

    return Expanded(
      child: ClipRRect(
        borderRadius: pillRadius,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: AnimatedContainer(
              duration: pillDuration,
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(
                vertical: isCenter ? 10 : 8,
                horizontal: isCenter ? 10 : 8,
              ),
              decoration: BoxDecoration(
                borderRadius: pillRadius,
                gradient: isSelected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          secondary,
                          primary,
                        ],
                      )
                    : null,
                color: isSelected ? null : Colors.transparent,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: primary.withValues(alpha: 0.26),
                          blurRadius: 14,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : [],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSlide(
                    duration: iconDuration,
                    curve: Curves.easeOutCubic,
                    offset: isSelected ? const Offset(0, -0.06) : Offset.zero,
                    child: AnimatedScale(
                      duration: iconDuration,
                      curve: Curves.easeOutBack,
                      scale: isSelected ? 1.10 : 1.0,
                      child: Icon(icon,
                          color: fgColor, size: isCenter ? 24 : 22),
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedDefaultTextStyle(
                    duration: textDuration,
                    curve: Curves.easeOutCubic,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: fgColor.withValues(alpha: isSelected ? 1.0 : 0.90),
                      letterSpacing: 0.1,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(label, maxLines: 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
