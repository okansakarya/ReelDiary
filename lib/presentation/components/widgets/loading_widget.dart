import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      color: AppColors.primary(context),
      size: 22,
      duration: const Duration(milliseconds: 1100),
    );
  }
}
