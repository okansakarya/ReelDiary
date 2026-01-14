import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_back_navigate_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_elevated_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/custom_divider_widget.dart';
import 'package:movieapp/presentation/pages/auth/login/components/widgets/login_form_widget.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/utils/screen_utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.newScaffoldBackground,
      body: Stack(
        children: [
          Positioned(
            top:
                -ScreenUtils.getScreenHeight(context) *
                0.05, // %5 kadar yukarı taşı
            right: 0,
            child: Image.asset(
              'resources/assets/images/login.png',
              height: ScreenUtils.getScreenHeight(context) * 0.7,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left:
                ScreenUtils.getScreenWidth(context) *
                0.03, // 11 px yaklaşık %3 ekran genişliği
            top:
                ScreenUtils.getScreenHeight(context) *
                0.05, // 40 px yaklaşık %5 ekran yüksekliği
            child: CustomBackNavigateButtonWidget(
              onPressed: () => context.pop(),
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
              buttonStyle: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(0),
                backgroundColor: AppColors.buttonAndText,
              ),
            ),
          ),
          Positioned(
            top:
                ScreenUtils.getScreenHeight(context) *
                0.25, // responsive yukarıdan
            left: 20,
            right: 20,

            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.welcomeCircleColor.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Giriş Yap',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: ScreenUtils.getScreenHeight(context) * 0.04,
                    ),
                    const LoginFormWidget(),
                    SizedBox(
                      height: ScreenUtils.getScreenHeight(context) * 0.02,
                    ),
                    const CustomDividerWidget(),
                    SizedBox(
                      height: ScreenUtils.getScreenHeight(context) * 0.02,
                    ),
                    CustomElevatedButtonWidget(
                      onPressed: () {
                        context.read<AuthCubit>().loginWithGoogle();
                      },
                      backgroundColor: Colors.white,
                      border: const BorderSide(color: AppColors.buttonAndText),
                      foregroundColor: AppColors.buttonAndText,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'resources/assets/icons/google.png',
                            height: IconTheme.of(context).size! * 1.2,
                            width: IconTheme.of(context).size! * 1.2,
                          ),
                          SizedBox(
                            width: ScreenUtils.getScreenWidth(context) * 0.0214,
                          ),
                          const Text(
                            'Google ile giriş yap',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
