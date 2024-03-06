// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_autocomplete_remote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationAutocompleteRemote _$LocationAutocompleteRemoteFromJson(
        Map<String, dynamic> json) =>
    LocationAutocompleteRemote(
      key: json['Key'] as String,
      name: json['LocalizedName'] as String,
      area: AreaRemote.fromJson(
          json['AdministrativeArea'] as Map<String, dynamic>),
      country: CountryRemote.fromJson(json['Country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationAutocompleteRemoteToJson(
        LocationAutocompleteRemote instance) =>
    <String, dynamic>{
      'Key': instance.key,
      'LocalizedName': instance.name,
      'AdministrativeArea': instance.area.toJson(),
      'Country': instance.country.toJson(),
    };
