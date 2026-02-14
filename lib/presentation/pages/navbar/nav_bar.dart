import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/presentation/pages/homePage/home_page.dart';
import 'package:movieapp/presentation/pages/navbar/components/state/nav_bar_cubit.dart';
import 'package:movieapp/presentation/pages/navbar/components/widgets/nav_item.dart';
import 'package:movieapp/presentation/pages/profilePage/profile_page.dart';
import 'package:movieapp/utils/screen_utils.dart';

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  static const Color splashPrimary = Color(0xFF3713EC);
  static const Color splashPrimaryMid = Color(0xFF4F2CE0);
  static const Color splashPrimaryLight = Color(0xFF6D4FF7);
  static const Color splashBackgroundLight = Color(0xFFF6F6F8);
  static const Color splashBackgroundDark = Color(0xFF131022);

  static const List<Widget> _pages = [
    HomePage(),
    Placeholder(),
    Placeholder(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = ScreenUtils.getScreenWidth(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final navBg = isDark ? splashBackgroundDark : splashBackgroundLight;
    final shadowColor = isDark
        ? Colors.black.withValues(alpha: 0.45)
        : Colors.black.withValues(alpha: 0.12);

    return BlocBuilder<NavBarCubit, int>(
      builder: (context, currentIndex) {
        return WillPopScope(
          onWillPop: () async {
            // ✅ geri basınca: home tab'a dön, home'daysa çık
            if (currentIndex != 0) {
              context.read<NavBarCubit>().setTab(0);
              return false;
            }
            return true;
          },
          child: Scaffold(
            backgroundColor: AppColors.backgroundDark,
            body: Container(
              color: AppColors.backgroundDark,
              child: IndexedStack(
                index: currentIndex,
                children: _pages,
              ),
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: Container(
                margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                decoration: BoxDecoration(
                  color: navBg,
                  borderRadius: BorderRadius.circular(screenWidth * 0.08),
                  border: Border.all(
                    color: splashPrimary.withValues(alpha: isDark ? 0.18 : 0.10),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      blurRadius: 18,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    NavItem(
                      icon: Icons.home,
                      label: 'Anasayfa',
                      isCenter: false,
                      isSelected: currentIndex == 0,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<NavBarCubit>().setTab(0);
                      },
                    ),
                    NavItem(
                      icon: Icons.favorite,
                      label: 'Favorilerim',
                      isCenter: false,
                      isSelected: currentIndex == 1,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<NavBarCubit>().setTab(1);
                      },
                    ),
                    NavItem(
                      icon: Icons.shopping_bag,
                      label: 'Notlarım',
                      isCenter: true,
                      isSelected: currentIndex == 2,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<NavBarCubit>().setTab(2);
                      },
                    ),
                    NavItem(
                      icon: Icons.person,
                      label: 'Profil',
                      isCenter: false,
                      isSelected: currentIndex == 3,
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.read<NavBarCubit>().setTab(3);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

