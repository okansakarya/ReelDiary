import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/auth/components/widgets/custom_elevated_button_widget.dart';
import 'package:movieapp/presentation/pages/auth/welcome/components/widgets/welcome_circle_widget.dart';
import 'package:movieapp/presentation/pages/auth/welcome/components/widgets/welcome_text_widget.dart';
import 'package:movieapp/utils/screen_utils.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // void _navigateLogin(){
  //
  // }
  // void _navigateRegister(){
  //
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.newScaffoldBackground, // Arkaplan rengi
      body: Stack(
        children: [
          // Sol üst resim
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              'resources/assets/images/top_left.png', // resim path
              width:
                  ScreenUtils.getScreenWidth(context) *
                  0.9, // cihaz boyutuna göre
              fit: BoxFit.cover,
            ),
          ),
          // Sağ alt resim
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'resources/assets/images/right_bottom.png',
              width: ScreenUtils.getScreenWidth(context) * 0.90,
              fit: BoxFit.cover,
            ),
          ),
          // Orta kısım
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const WelcomCircleWidget(),
                SizedBox(
                  height: ScreenUtils.getScreenHeight(context) * 0.05,
                ),
                // RichText
                const WelcomeTextWidget(),
                SizedBox(
                  height: ScreenUtils.getScreenHeight(context) * 0.03,
                ),
                SizedBox(
                  width: ScreenUtils.getScreenWidth(context) * 0.8,
                  child: CustomElevatedButtonWidget(
                    onPressed: () {
                      context.push('/login');
                    },
                    backgroundColor: AppColors.buttonAndText,
                    child: const Text('Giriş Yap'),
                  ),
                ),
                SizedBox(height: ScreenUtils.getScreenHeight(context) * 0.03),
                SizedBox(
                  width: ScreenUtils.getScreenWidth(context) * 0.8,
                  child: CustomElevatedButtonWidget(
                    border: const BorderSide(color: AppColors.buttonAndText),
                    onPressed: () {
                      context.push('/register');
                    },
                    backgroundColor: Colors.white,
                    foregroundColor: AppColors.buttonAndText,
                    child: const Text('Kayıt ol'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
