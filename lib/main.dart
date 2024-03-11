import 'package:flutter/material.dart';
import 'package:weather_bloc_app/data/common/environment.dart';
import 'package:weather_bloc_app/injection.dart';

import 'presentation/common/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies(EnvironmentConfig.resolveEnvironmentType());

  runApp(const App());
}
