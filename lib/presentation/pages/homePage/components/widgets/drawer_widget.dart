import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/core/constants/app_colors.dart';
import 'package:movieapp/core/extensions/user_extensions.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/navbar/components/state/nav_bar_cubit.dart';
import 'package:movieapp/utils/screen_utils.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AuthCubit>().currentUser;
    final initials = user.getInitials();
    final textPrimary = AppColors.textPrimary(context);
    final primary = AppColors.primary(context);
    return Drawer(
      backgroundColor: AppColors.surfaceVariant(context),
      child: SafeArea(
        child: ListView(
          children: [
            ListTile(
              shape: Border(bottom: BorderSide(color: Colors.white, width: 3)),
              leading: CircleAvatar(
                backgroundColor: primary,
                child: Text(
                  initials,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
              title: Text(
                user?.email ?? '',
                style: TextStyle(
                  fontSize: ScreenUtils.getScreenWidth(context) * 0.027,
                  color: textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle:
                  user != null && (user.displayNameOrNull ?? '').isNotEmpty
                  ? Text(
                      user.displayNameOrNull!,
                      style: TextStyle(
                        fontSize: ScreenUtils.getScreenWidth(context) * 0.05,
                        color: AppColors.textSecondary(context),
                      ),
                    )
                  : null,
              trailing: IconButton(
                icon: Icon(Icons.logout, color: textPrimary),
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<AuthCubit>().logout();
                  context.go('/login');
                },
              ),
            ),

            ListTile(
              leading: Icon(Icons.home, color: textPrimary),
              title: Text(
                'Anasayfa',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              onTap: () => context.pop(),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.person, color: textPrimary),
              title: Text(
                'Favorilerim',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              onTap: () {
                context.read<NavBarCubit>().setTab(1);
                Navigator.of(context).pop();
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.person, color: textPrimary),
              title: Text(
                'Notlarım',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              onTap: () {
                context.read<NavBarCubit>().setTab(2);
                Navigator.of(context).pop();
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.person, color: textPrimary),
              title: Text(
                'Profil',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              onTap: () {
                context.read<NavBarCubit>().setTab(3);
                Navigator.of(context).pop();
              },
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout, color: textPrimary),
              title: Text(
                'Çıkış Yap',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: textPrimary,
                ),
              ),
              onTap: () {
                context.read<AuthCubit>().logout();
                context.go('/login');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
