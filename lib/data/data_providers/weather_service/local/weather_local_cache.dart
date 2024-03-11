import 'package:injectable/injectable.dart';
import 'package:weather_bloc_app/data/common/environment.dart';

import '../../../models/location_autocomplete/remote/location_autocomplete_remote.dart';

@prodEnv
@LazySingleton()
class WeatherLocalCache {
  Map<String, List<LocationAutocompleteRemote>> get cachedCitySearch =>
      Map.unmodifiable(_cachedCitySearch);

  final Map<String, List<LocationAutocompleteRemote>> _cachedCitySearch = {};

  void updateCachedCitySearch(
      String key, List<LocationAutocompleteRemote> value) {
    _cachedCitySearch[key] = value;
  }
}
