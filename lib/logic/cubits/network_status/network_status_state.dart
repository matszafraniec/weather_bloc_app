part of 'network_status_cubit.dart';

sealed class NetworkStatusState extends Equatable {
  const NetworkStatusState();

  @override
  List<Object> get props => [];
}

final class NetworkStatusInitial extends NetworkStatusState {
  const NetworkStatusInitial();
}

final class NetworkStatusConnected extends NetworkStatusState {
  const NetworkStatusConnected();
}

final class NetworkStatusDisconnected extends NetworkStatusState {
  const NetworkStatusDisconnected();
}
