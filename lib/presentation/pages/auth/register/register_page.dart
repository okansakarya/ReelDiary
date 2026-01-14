import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_back_navigate_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/register/components/widgets/register_form_widget.dart';
import 'package:movieapp/utils/screen_utils.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.newScaffoldBackground,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            // ortalama için
            child: Image.asset(
              'resources/assets/images/register.png',
              height:
                  ScreenUtils.getScreenHeight(context) *
                  0.8, // ekranın yarısı kadar uzasın
              fit: BoxFit.contain, // resmi kırpmaz
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
                0.15, // responsive yukarıdan
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
                      'Kayıt Ol',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      height: ScreenUtils.getScreenHeight(context) * 0.04,
                    ),
                    const RegisterFormWidget(),
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
