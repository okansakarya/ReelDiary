import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/state/settings/theme_cubit.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.shortestSide >= 600;
    final logoMaxH = (size.height * (isTablet ? 0.28 : 0.22)).clamp(140.0, 260.0);
    final iconColor = AppColors.textPrimary(context);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        final isDark = themeMode == ThemeMode.dark;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    isDark ? Icons.light_mode : Icons.dark_mode,
                    color: iconColor,
                  ),
                  onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                ),
              ],
            ),
            const Spacer(flex: 1),
            Expanded(
              flex: 12,
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: logoMaxH),
                  child: Image.asset(
                    'resources/assets/images/reeldiarylogo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'Welcome Again',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.2,
                    color: iconColor,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  'Sign in to continue your movie diary.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary(context),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 1),
          ],
        );
      },
    );
  }
}
