/*
import 'package:firebase_analytics/observer.dart';

import '../services/analytics_service.dart';

/// Analytics Repo
class AnalyticsRepository {

  /// Constructor
  AnalyticsRepository(this._analyticsService);

  /// Analytics Service
  AnalyticsService _analyticsService;

  /// Observer
  FirebaseAnalyticsObserver get observer => _analyticsService.observer;

  /// Event loglama
  Future<void> logEvent({required String eventName, required Map<String,
      Object>? parameters}) async {
    try {
      await _analyticsService.logEvent(
          eventName: eventName, parameters: parameters);
    }catch(e){

    }
  }

} */