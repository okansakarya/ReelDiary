import 'package:flutter/material.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/welcome/components/animations/soft_pulse_animation.dart';
import 'package:movieapp/utils/screen_utils.dart';

class WelcomCircleWidget extends StatelessWidget {
  const WelcomCircleWidget({
    super.key,
    this.size,
    this.enablePulse = true,
  });

  final double? size;
  final bool enablePulse;

  @override
  Widget build(BuildContext context) {
    final w = ScreenUtils.getScreenWidth(context);

    // ✅ clamp num döndürür -> toDouble()
    final double s = (size ??
        (w > 420 ? 110.0 : w * 0.24).clamp(86.0, 118.0).toDouble());

    final circle = DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.06),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.28),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.18),
            blurRadius: 26,
            spreadRadius: 1,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(s * 0.16),
        child: ClipOval( // ✅ circle için ClipRRect yerine daha doğru
          child: Image.asset(
            'resources/assets/images/reeldiarylogo.png',
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );

    return Center(
      child: enablePulse ? SoftPulse(child: circle) : circle,
    );
  }
}
