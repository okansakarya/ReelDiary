/*
import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';

class FirebaseConfig {

  static Future<void> initializeFirebase() async{
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  static Future<void> initializeFirebaseCrashlytics() async{
    // Crashlytics hataları yakala
    final FirebaseCrashlytics _firebaseCrashlytics = FirebaseCrashlytics.instance;
    // Flutter framework'ün kendi error handling mekanizmasını kullan
    FlutterError.onError = _firebaseCrashlytics.recordFlutterFatalError;
    // Hata raporlama özelliğini etkinleştir
    await _firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);

    // Platform dispatching hatalarını yakala (iOS, Android native hatalar)
    PlatformDispatcher.instance.onError = (error, stack) {
      _firebaseCrashlytics.recordError(error, stack, fatal: true);
      return true;
    };
  }

}*/