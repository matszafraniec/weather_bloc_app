import 'package:json_annotation/json_annotation.dart';

part 'country_remote.g.dart';

@JsonSerializable()
class CountryRemote {
  @JsonKey(name: 'LocalizedName')
  final String name;

  CountryRemote({
    required this.name,
  });

  factory CountryRemote.fromJson(Map<String, dynamic> json) =>
      _$CountryRemoteFromJson(json);
  Map<String, dynamic> toJson() => _$CountryRemoteToJson(this);
}
