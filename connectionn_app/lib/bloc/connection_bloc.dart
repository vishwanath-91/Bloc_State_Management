import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;
  ConnectionBloc() : super(const ConnectionState()) {
    on<InternetLoastEvent>((event, emit) {
      emit(ConnectionLoastState());
    });
    on<InternetGainedEvent>((event, emit) {
      emit(ConnectionGaindState());
    });

    connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetGainedEvent());
      } else {
        add(InternetLoastEvent());
      }
    });
    @override
    Future<void> close() {
      connectivitySubscription!.cancel();
      return super.close();
    }
  }
}
