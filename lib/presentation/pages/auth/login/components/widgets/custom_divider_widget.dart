import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/utils/screen_utils.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.textPrimary(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: color,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtils.getScreenWidth(context) * 0.03,
          ),
          child: Text(
            'veya',
            style: TextStyle(color: color),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: color,
          ),
        ),
      ],
    );
  }
}
