import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movieapp/presentation/pages/homePage/home_page.dart';
import 'package:movieapp/presentation/pages/notFound/notFound_page.dart';




/// Route Utils
class RouterUtils {
  /// Route settings
  GoRouter routerConfig() {
    return GoRouter(
      initialLocation: '/home',
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const NotFoundPage(),
      //observers: [AnalyticsRepository(AnalyticsService()).observer],
    );
  }
}
