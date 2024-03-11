import 'package:flutter/material.dart';
import 'package:weather_bloc_app/data/common/environment.dart';

import 'injection/injection.dart';
import 'presentation/common/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies(EnvironmentConfig.type);

  runApp(const App());
}
