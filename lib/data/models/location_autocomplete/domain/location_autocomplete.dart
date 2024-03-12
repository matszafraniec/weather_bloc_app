import 'package:weather_bloc_app/data/models/location_autocomplete/remote/location_autocomplete_remote.dart';
import 'package:weather_bloc_app/data/models/weather_current_conditions/domain/location_info.dart';

class LocationAutocomplete {
  final String key;
  final String name;
  final String country;
  final String area;

  LocationAutocomplete({
    required this.key,
    required this.name,
    required this.country,
    required this.area,
  });

  factory LocationAutocomplete.fromRemote(LocationAutocompleteRemote remote) =>
      LocationAutocomplete(
        key: remote.key,
        name: remote.name,
        country: remote.country.name,
        area: remote.area.name,
      );

  factory LocationAutocomplete.fromLocationInfo(LocationInfo locationInfo) =>
      LocationAutocomplete(
        key: locationInfo.key,
        name: locationInfo.city,
        country: locationInfo.country,
        area: locationInfo.area,
      );

  LocationInfo toLocationInfo() => LocationInfo(
        key: key,
        city: name,
        country: country,
        area: area,
      );
}
