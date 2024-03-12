import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../injection/injection.dart';
import '../../../logic/cubits/network_status/network_status_cubit.dart';
import '../../../logic/cubits/weather/weather_cubit.dart';
import '../../common/ui/dialog_helper.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ScaffoldWithNavBar(this.navigationShell, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetworkStatusCubit>(
          create: (context) => locator.get<NetworkStatusCubit>(),
        ),
        BlocProvider<WeatherCubit>(
          create: (context) => locator.get<WeatherCubit>(),
        ),
      ],
      child: BlocListener<NetworkStatusCubit, NetworkStatusState>(
        listener: _handleNetworkStatusInfo,
        listenWhen: (previous, current) => previous != current,
        child: Scaffold(
          body: navigationShell,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
            onTap: _onTap,
          ),
        ),
      ),
    );
  }

  void _handleNetworkStatusInfo(
      BuildContext context, NetworkStatusState state) {
    if (state is NetworkStatusDisconnected) {
      DialogHelper.of(context).show(
        title: 'Network disconnected',
        icon: Icons.wifi_off,
      );
    }
  }

  void _onTap(index) => navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
}
