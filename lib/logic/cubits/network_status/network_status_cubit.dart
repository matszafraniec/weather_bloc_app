import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'network_status_state.dart';

class NetworkStatusCubit extends Cubit<NetworkStatusState> {
  NetworkStatusCubit() : super(NetworkStatusInitial());
}
