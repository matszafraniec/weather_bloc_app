import 'package:flutter/material.dart';
import 'package:weather_bloc_app/service_locator.dart';

import 'presentation/common/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  runApp(const App());
}
