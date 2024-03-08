import 'package:flutter/material.dart';

import '../../service_locator.dart';
import 'routing/app_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

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
        routerConfig: locator.get<AppNavigator>().router,
        debugShowCheckedModeBanner: false,
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
