import 'package:connectivity_plus/connectivity_plus.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repository/connectivity_repository.dart';
import 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final ConnectivityRepository _connectivityRepository;

  ConnectivityCubit(this._connectivityRepository) : super(ConnectivityInitial()) {
    _connectivityRepository.connectivityStream.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityDisconnected());
      } else {
        emit(ConnectivityConnected());
      }
    });
  }

}
