import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    final base = AppColors.surfaceVariant(context);
    final highlight = AppColors.textSecondary(context);
    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: base,
      ),
    );
  }
}
