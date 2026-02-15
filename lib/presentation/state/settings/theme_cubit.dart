import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _kThemeModeKey = 'theme_mode';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit(super.initialTheme);

  Future<void> setLightTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemeModeKey, 'light');
    emit(ThemeMode.light);
  }

  Future<void> setDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemeModeKey, 'dark');
    emit(ThemeMode.dark);
  }

  Future<void> toggleTheme() async {
    if (state == ThemeMode.dark) {
      await setLightTheme();
    } else {
      await setDarkTheme();
    }
  }

  /// Call before runApp to get last saved theme. Defaults to [ThemeMode.dark] if none saved.
  static Future<ThemeMode> loadSavedTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_kThemeModeKey);
    if (saved == 'light') return ThemeMode.light;
    if (saved == 'system') return ThemeMode.system;
    return ThemeMode.dark;
  }
}
