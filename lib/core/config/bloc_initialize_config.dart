import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/data/repository/auth_repository.dart';
import 'package:movieapp/data/services/auth_service.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/state/password_cubit.dart';
import 'package:movieapp/presentation/pages/auth/state/auth_cubit.dart';
import 'package:movieapp/presentation/pages/navbar/components/state/nav_bar_cubit.dart';

import '../../data/repository/connectivity_repository.dart';
import '../../data/services/connectivity_service.dart';
import '../../presentation/state/connectivity/connectivity_cubit.dart';
import '../../presentation/state/settings/language_cubit.dart';
import '../../presentation/state/settings/theme_cubit.dart';

class BlocInitialize extends StatelessWidget {
  const BlocInitialize({
    required this.child,
    required this.initialTheme,
    required this.initialLocale,
    super.key,
  });

  final Widget child;
  final ThemeMode initialTheme;
  final Locale initialLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(initialTheme),
        ),
        BlocProvider<LanguageCubit>(
          create: (_) => LanguageCubit(initialLocale),
        ),
        BlocProvider<ConnectivityCubit>(
          create: (_) =>
              ConnectivityCubit(ConnectivityRepository(ConnectivityService())),
        ),
        BlocProvider<AuthCubit>(
          create: (_) =>
              AuthCubit(AuthRepository(AuthService())),
        ),
        BlocProvider<PasswordCubit>(
          create: (_) => PasswordCubit(AuthRepository(AuthService())),
        ),
        BlocProvider<NavBarCubit>(
          create: (_) => NavBarCubit(),
        ),
      ],
      child: child,
    );
  }
}
