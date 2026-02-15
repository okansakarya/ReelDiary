import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/welcome/components/widgets/welcome_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/welcome/components/widgets/welcome_circle_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface(context),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;

            // Tablet / geniş ekranda içerik çok yayılmasın
            final maxWidth = w > 520 ? 420.0 : w * 0.90;

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 14,
                  ),
                  child: Column(
                    children: [
                      const Spacer(flex: 2),

                      // HERO
                      Expanded(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Logo / ikon
                            WelcomCircleWidget(),
                            const SizedBox(height: 18),
                            Text(
                              'ReelDiary',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                height: 1.05,
                                color: AppColors.textPrimary(context),
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 10),

                            Text(
                              'İzlediğin filmlerin günlüğünü tut.\nVizyon filmlerini gör, güncel kal.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.4,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary(context).withOpacity(0.75),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ACTIONS
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WelcomeButtonWidget(
                              child: Text(
                                'Giriş Yap',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              backgroundColor: AppColors.primary(context),
                              borderColor: AppColors.primary(context),
                              onPressed: () => context.push('/login'),
                            ),
                            const SizedBox(height: 12),
                            WelcomeButtonWidget(
                              child: Text(
                                'Kayıt Ol',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface,
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              backgroundColor: AppColors.secondary(context)
                                  .withOpacity(0.35),
                              borderColor: AppColors.textPrimary(context).withOpacity(0.18),
                              onPressed: () => context.push('/register'),
                            ),
                            const SizedBox(height: 18),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                              ),
                              child: Text(
                                'Devam ederek Hizmet ve Gizlilik Sözleşmesini kabul etmiş sayılırsınız.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  height: 1.35,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary(context).withOpacity(0.45),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
