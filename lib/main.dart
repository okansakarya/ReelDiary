import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movieapp/app.dart';
import 'package:movieapp/core/config/app_initialize_config.dart';
import 'package:movieapp/core/config/bloc_initialize_config.dart';
import 'package:movieapp/core/config/localization_initialize_config.dart';
import 'package:movieapp/core/config/supabase_config.dart';
import 'package:movieapp/presentation/state/settings/theme_cubit.dart';
import 'package:movieapp/utils/logger_utils.dart';

import 'package:timeago/timeago.dart' as timeago;


/// Uygulama başlangıç ayarları
Future<void> initialize() async {
  try {
    await initializeApp();
    await EasyLocalization.ensureInitialized();

    await dotenv.load(fileName: '.env');


    // 🔥 Firebase geçici olarak devre dışı bırakıldı
    // await FirebaseConfig.initializeFirebase();
    // await FirebaseConfig.initializeFirebaseCrashlytics();

    // ✅ Supabase aktif kalıyor
    await SupabaseConfig.initializeSupabase();

    // Türkçe zaman formatı (örnek: "5 dakika önce")
    timeago.setLocaleMessages('tr', timeago.TrMessages());

    LoggerUtils.logger.i('İnitialize işlemleri başarılı!');
  } catch (e) {
    LoggerUtils.logger.e('İnitialize işlemleri başarısız! Hata: $e');
  }
}

Future<void> main() async {
  await initialize();
  LoggerUtils.logger.i('Uygulama başlatılıyor!');

  final initialTheme = await ThemeCubit.loadSavedTheme();

  runApp(
    LocalizationInitialize(
      child: BlocInitialize(
        initialLocale: const Locale('tr', 'TR'),
        initialTheme: initialTheme,
        child: const App(),
      ),
    ),
  );
}
