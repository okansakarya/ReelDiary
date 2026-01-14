import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movieapp/core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCircle(
      color: AppColors.primaryColor, // ✅ ReelDiary primary (kırmızı)
      size: 22,
      duration: Duration(milliseconds: 1100),
    );
  }
}
