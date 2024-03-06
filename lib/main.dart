import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:weather_bloc_app/data/repositories/weather_repository.dart';
import 'package:weather_bloc_app/logic/cubits/weather/weather_cubit.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

void main() {
  _setupServiceLocator();

  runApp(App());
}

final locator = GetIt.instance;

_setupServiceLocator() {
  locator.registerFactory(
    () => WeatherCubit(locator()),
  );

  locator
      .registerLazySingleton<WeatherRepository>(() => WeatherRepositoryImpl());
}

class App extends StatelessWidget {
  final navigator = AppNavigator();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _hideKeyboard(context),
      child: MaterialApp.router(
        title: 'Weather BLoC app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: navigator.router,
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
