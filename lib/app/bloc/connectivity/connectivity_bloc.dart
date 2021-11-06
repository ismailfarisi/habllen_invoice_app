import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ConnectivityBloc() : super(ConnectivityState()) {
    on<StartListening>((event, emit) {
      _init();
      this.add(OnConnectionChanged());
    });
    on<OnConnectionChanged>((event, emit) {
      if (_connectionStatus != ConnectivityResult.none) {
        emit(state.copyWith(hasConnection: false));
      } else {
        emit(state.copyWith(hasConnection: true));
      }
    });
  }
  void _init() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus = result;
  }
}
