// services/connectivity_service.dart
import 'package:connectivity_plus/connectivity_plus.dart';

/// Connectiviry servisi (Stream türünde dönüş)
class ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  Stream<ConnectivityResult> get connectivityStream =>
      _connectivity.onConnectivityChanged.map((List<ConnectivityResult> results) => results.first);
}
