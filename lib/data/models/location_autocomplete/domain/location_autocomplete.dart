import 'package:weather_bloc_app/data/models/location_autocomplete/remote/location_autocomplete_remote.dart';

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
}
