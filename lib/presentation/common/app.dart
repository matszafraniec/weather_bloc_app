import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc_app/logic/cubits/network_status/network_status_cubit.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';

import '../../injection/injection.dart';
import 'app_theme.dart';
import 'routing/app_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<NetworkStatusCubit>(
            create: (context) => locator.get<NetworkStatusCubit>(),
          ),
          BlocProvider<WeatherCubit>(
            create: (context) => locator.get<WeatherCubit>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Weather BLoC app',
          theme: lightTheme(),
          darkTheme: darkTheme(),
          routerConfig: locator.get<AppNavigator>().router,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

void _hideKeyboard(BuildContext context) {
  final currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
