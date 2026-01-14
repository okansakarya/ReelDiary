import 'package:connectivity_plus/connectivity_plus.dart';

import '../services/connectivity_service.dart';

class ConnectivityRepository {
  ConnectivityRepository(this._connectivityService);
  final ConnectivityService _connectivityService;

  Stream<ConnectivityResult> get connectivityStream => _connectivityService.connectivityStream;
}