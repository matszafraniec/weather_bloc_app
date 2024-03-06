import 'package:json_annotation/json_annotation.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/remote/area/area_remote.dart';
import 'package:weather_bloc_app/data/models/location_autocomplete/remote/country/country_remote.dart';

part 'location_autocomplete_remote.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationAutocompleteRemote {
  @JsonKey(name: 'Key')
  final String key;
  @JsonKey(name: 'LocalizedName')
  final String name;
  @JsonKey(name: 'AdministrativeArea')
  final AreaRemote area;
  @JsonKey(name: 'Country')
  final CountryRemote country;

  LocationAutocompleteRemote({
    required this.key,
    required this.name,
    required this.area,
    required this.country,
  });

  factory LocationAutocompleteRemote.fromJson(Map<String, dynamic> json) =>
      _$LocationAutocompleteRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$LocationAutocompleteRemoteToJson(this);
}
