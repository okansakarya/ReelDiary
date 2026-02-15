import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/components/widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  Future<void> initialize() async {
    _setupAnimations();
    await _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3), () {
        if (mounted) context.go('/auth_wrapper');
      });
    });
  }

  void _setupAnimations() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    );

    final curved = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(curved);
    _scale = Tween<double>(begin: 0.96, end: 1.0).animate(curved);
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.surface(context),
                AppColors.secondary(context).withValues(alpha: 0.85),
                AppColors.surface(context),
              ],
            ),
          ),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: Column(
                    children: [
                      const Spacer(flex: 2),

                      // ✅ Logo alanı: Expanded ile ekranı “gerçekten” dolduran responsive bölüm
                    Expanded(
                      flex: 7,
                      child: Center(
                        child: Image.asset(
                          'resources/assets/images/reeldiarylogo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),


                      // ✅ İstersen logoda yazı varsa bu iki satırı silebilirsin
                      const SizedBox(height: 12),
                      Text(
                        'ReelDiary',
                        style: TextStyle(
                          color: AppColors.primary(context),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Track what you watch',
                        style: TextStyle(
                          color: AppColors.textPrimary(context).withValues(alpha: 0.70),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                        ),
                      ),

                      const Spacer(flex: 2),

                      // ✅ Loading (altta sabit)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const LoadingWidget(),
                            const SizedBox(width: 10),
                            Text(
                              'Yükleniyor...',
                              style: TextStyle(
                                color: AppColors.textPrimary(context).withValues(alpha: 0.85),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
