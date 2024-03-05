import 'package:flutter/material.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  final navigator = AppNavigator();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Weather BLoC app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: navigator.router,
    );
  }
}
