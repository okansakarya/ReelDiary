import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';

/// Tab navigation widget for filtering movies
class HomeTabsWidget extends StatefulWidget {
  const HomeTabsWidget({super.key});

  @override
  State<HomeTabsWidget> createState() => _HomeTabsWidgetState();
}

class _HomeTabsWidgetState extends State<HomeTabsWidget> {
  int _selectedIndex = 0;

  final List<String> _tabs = [
    'Popular',
    'In Theaters',
    'Coming Soon',
    'Top Rated',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.95),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  _tabs.length,
                  (index) => _TabButton(
                    label: _tabs[index],
                    isActive: _selectedIndex == index,
                    isFirst: index == 0,
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isActive,
    required this.isFirst,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final bool isFirst;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: isFirst ? 0 : 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: isActive
              ? AppColors.primaryColor
              : AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(999),
          border: isActive
              ? null
              : Border.all(
                  color: Colors.white.withOpacity(0.1),
                  width: 1,
                ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: AppColors.primaryColor.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            color: isActive
                ? AppColors.textColor
                : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
