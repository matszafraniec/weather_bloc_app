import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_bloc_app/logic/cubits/favorite/favorite_cubit.dart';
import 'package:weather_bloc_app/logic/cubits/history/history_cubit.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_bloc_app/presentation/common/routing/routes.dart';
import 'package:weather_bloc_app/presentation/screens/favorites/favorites_screen.dart';
import 'package:weather_bloc_app/presentation/screens/history/history_screen.dart';
import 'package:weather_bloc_app/presentation/screens/home/home_screen.dart';

import '../../../injection.dart';
import '../../screens/home/scaffold_with_navbar.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

class AppNavigator {
  final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => ScaffoldWithNavBar(
          navigationShell,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _sectionNavigatorKey,
            routes: [
              GoRoute(
                path: Routes.home,
                builder: (context, state) => BlocProvider<WeatherCubit>(
                  create: (context) => locator.get<WeatherCubit>(),
                  child: const HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.favorites,
                builder: (context, state) => BlocProvider<FavoriteCubit>(
                  create: (context) => locator.get<FavoriteCubit>(),
                  child: const FavoritesScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.history,
                builder: (context, state) => BlocProvider<HistoryCubit>(
                  create: (context) => locator.get<HistoryCubit>(),
                  child: const HistoryScreen(),
                ),
              ),
            ],
          )
        ],
      ),
    ],
  );
}
