import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

/// Global bottom navigation bar for home page
class HomeBottomNavWidget extends StatelessWidget {
  const HomeBottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface(context).withOpacity(0.7),
        border: Border(
          top: BorderSide(
            color: AppColors.textPrimary(context).withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Colors.transparent,
            child: SafeArea(
              top: false,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavItem(
                      icon: Icons.home,
                      label: 'Home',
                      isActive: true,
                      onTap: () {},
                    ),
                    _NavItem(
                      icon: Icons.favorite,
                      label: 'Favorites',
                      isActive: false,
                      onTap: () {},
                    ),
                    _NavItem(
                      icon: Icons.person,
                      label: 'Profile',
                      isActive: false,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: isActive
                    ? Colors.transparent
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    icon,
                    size: 28,
                    color: isActive
                        ? AppColors.primary(context)
                        : AppColors.textSecondary(context),
                    fill: isActive ? 1.0 : 0.0,
                  ),
                  if (isActive)
                    Positioned(
                      bottom: -8,
                      child: Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.primary(context),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: isActive
                    ? AppColors.textPrimary(context)
                    : AppColors.textSecondary(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
