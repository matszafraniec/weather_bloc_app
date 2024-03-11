import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/data_sources/local/local_database_source.dart';
import 'package:weather_bloc_app/presentation/common/routing/app_navigator.dart';

import 'injection.config.dart';

final locator = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> setupDependencies(Environment environment) async {
  locator.registerSingleton(AppNavigator());
  locator
      .registerSingleton<LocalDatabaseSource>(LocalDatabaseSourceImpl())
      .setup();

  locator.init(environment: environment.name);
}
