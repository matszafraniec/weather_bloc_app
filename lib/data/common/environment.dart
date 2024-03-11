import 'dart:developer';

import 'package:injectable/injectable.dart';

const prodEnv = Environment('prod');
const mockEnv = Environment('mock');

class EnvironmentConfig {
  static const weatherApiKey = String.fromEnvironment('WEATHER_API_KEY');

  static Environment resolveEnvironmentType() {
    if (EnvironmentConfig.weatherApiKey.isEmpty) {
      log('Connected to ${mockEnv.name}', name: 'Environment');

      return mockEnv;
    } else {
      log('Connected to ${prodEnv.name}', name: 'Environment');

      return prodEnv;
    }
  }
}
