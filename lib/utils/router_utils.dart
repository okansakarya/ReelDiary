import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/presentation/pages/auth/auth_wrapper/auth_wrapper.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/changeUserPassword/change_user_password.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/sendResetPasswordCode/reset_password.dart';
import 'package:movieapp/presentation/pages/auth/forgotPassword/verifyUserPassword/verify_user_password.dart';
import 'package:movieapp/presentation/pages/auth/login/login_page.dart';
import 'package:movieapp/presentation/pages/auth/register/register_page.dart';
import 'package:movieapp/presentation/pages/auth/welcome/welcome_page.dart';
import 'package:movieapp/presentation/pages/homePage/home_page.dart';
import 'package:movieapp/presentation/pages/navbar/nav_bar.dart';
import 'package:movieapp/presentation/pages/notFound/notFound_page.dart';
import 'package:movieapp/presentation/pages/splash/splash_page.dart';

/// Route Utils
class RouterUtils {
  /// Route settings
  GoRouter routerConfig() {
    return GoRouter(
      initialLocation: '/splash',
      routes: <RouteBase>[
        GoRoute(
          path: '/splash',
          builder: (BuildContext context, GoRouterState state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: '/auth_wrapper',
          builder: (BuildContext context, GoRouterState state) {
            return const AuthWrapper();
          },
        ),
        GoRoute(
          path: '/welcome',
          builder: (BuildContext context, GoRouterState state) {
            return const WelcomePage();
          },
        ),
        GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: '/register',
          builder: (BuildContext context, GoRouterState state) {
            return const RegisterPage();
          },
        ),
        GoRoute(
          path: '/forgotPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ResetPasswordPage();
          },
        ),
        GoRoute(
          path: '/verifyCodePage',
          builder: (BuildContext context, GoRouterState state) {
            return const VerifyCodePage();
          },
        ),
        GoRoute(
          path: '/changeUserPassword',
          builder: (BuildContext context, GoRouterState state) {
            return const ChangeUserPasswordPage();
          },
        ),
        GoRoute(
          path: '/navBarPage',
          builder: (BuildContext context, GoRouterState state) {
            return const NavBarPage();
          },
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const NotFoundPage(),
      //observers: [AnalyticsRepository(AnalyticsService()).observer],
    );
  }
}
