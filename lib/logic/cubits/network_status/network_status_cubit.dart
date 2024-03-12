import 'dart:async';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/extensions.dart';

import '../../../data/common/statics.dart';

part 'network_status_state.dart';

@injectable
class NetworkStatusCubit extends Cubit<NetworkStatusState> {
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  NetworkStatusCubit() : super(const NetworkStatusInitial()) {
    _monitorNetworkStatus();
  }

  void _monitorNetworkStatus() {
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult.isConnected) {
          log('Network connected', name: Statics.loggerNetworkStatusName);

          emit(const NetworkStatusConnected());
        } else if (connectivityResult.isDisconnected) {
          log('Network disconnected', name: Statics.loggerNetworkStatusName);

          emit(const NetworkStatusDisconnected());
        }
      },
    );
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
