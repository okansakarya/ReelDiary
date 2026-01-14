import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/config/theme_config.dart';
import 'package:movieapp/presentation/components/widgets/connectivity_overlay_widget.dart';
import 'package:movieapp/presentation/state/settings/theme_cubit.dart';
import 'package:movieapp/utils/router_utils.dart';


/// Uygulamanın yapılandırıldığı nokta
class App extends StatelessWidget {
  ///
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (BuildContext context, ThemeMode themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Shop App',
            theme: ThemeConfig.lightTheme,
            darkTheme: ThemeConfig.darkTheme,
            themeMode: themeMode,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerConfig: RouterUtils().routerConfig(),
            builder: (BuildContext context, Widget? child) {
              return ConnectivityOverlayWidget(child: child!);
            },

          );
        }
    );
  }
}
