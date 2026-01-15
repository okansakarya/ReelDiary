import 'package:flutter/material.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.shortestSide >= 600;

    // Logo height clamp (responsive + safe)
    final logoMaxH = (size.height * (isTablet ? 0.28 : 0.22)).clamp(140.0, 260.0);

    return Column(
      children: [
        const Spacer(flex: 1),
        Expanded(
          flex: 8,
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
          flex: 2,
          child: Center(
            child: Text(
              'Welcome Again',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.2,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'Sign in to continue your movie diary.',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white.withOpacity(0.70),
              ),
            ),
          ),
        ),

        const Spacer(flex: 1),
      ],
    );
  }
}
